//
//  TopMoviesViewController.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 28/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import UIKit

class TopMoviesViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Get the top movies
		Network.shared.getTopMovies()
	}
}

// MARK: - Network Delegate
extension TopMoviesViewController: NetworkDelegate {
	func got(topMovies: TopMovies?, or networkError: NetworkError?) {

	}
}
