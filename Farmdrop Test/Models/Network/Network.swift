//
//  Network.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import Foundation
import Alamofire

/// This class handles all the Network requests for the application
/// Note: This app uses the themoviedb.org API
class Network {

	// Singleton
	static let shared = Network()

	// Delegate
	weak var delegate: NetworkDelegate?

	// Variables
	let constants = Constants()

	// MARK: - Network Functions

	/// Gets the top movies from the
	func getTopMovies() {
		// Make sure we have a top movies url
		guard let topMoviesUrl = Endpoints.topMovies.url else { return }

		// Create an empty Movie array & an error
		var topMovies: TopMovies?
		var error: NetworkError?

		// Start the top movies request
		Alamofire.request(
			topMoviesUrl, method: .get, parameters: ["api_key": constants.apiKey],
			encoding: URLEncoding.default, headers: nil).response { response in

				// Make sure we have data & a status code to check
				guard let data = response.data, let statusCode = response.response?.statusCode else { return }

				// Create & customize the JSONDecoder
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase

				// Parse the data or the error
				if statusCode < 300 && statusCode >= 200 {
					topMovies = try? decoder.decode(TopMovies.self, from: data)

				} else {
					error = try? decoder.decode(NetworkError.self, from: data)
				}

				// Call the delegate
				self.delegate?.got(topMovies: topMovies, or: error)
		}
	}
}

// MARK: - Endpoints
extension Network {
	enum Endpoints: String {
		case topMovies = "https://api.themoviedb.org/3/movie/top_rated"
		case moviePoster = "https://image.tmdb.org/t/p/original"

		var url: URL? { URL(string: self.rawValue) }
	}
}

// MARK: - Constants
extension Network {
	struct Constants {
		let apiKey = "06c477fb6235927e8e8ea7e96b18133c"
	}
}

// MARK: - Network Delegate Declaration & Implementation
protocol NetworkDelegate: class {
	func got(topMovies: TopMovies?, or networkError: NetworkError?)
}

extension NetworkDelegate {
	func got(topMovies: TopMovies?, or networkError: NetworkError?) { }
}
