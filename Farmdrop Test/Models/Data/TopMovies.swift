//
//  TopMovies.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import Foundation

struct TopMovies: Codable {

	// This data is used for paging
	let page: Int
	let totalResults: Int
	let totalPages: Int

	let movies: Movies

	// MARK: - The CodingKeys used by the JSONDecoder
	enum CodingKeys: String, CodingKey {
		case page
		case totalResults
		case totalPages
		case movies = "results"
	}
}
