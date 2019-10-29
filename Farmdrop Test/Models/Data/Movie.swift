//
//  Movie.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import Foundation

/// Movie array typealias
typealias Movies = [Movie]

struct Movie: Codable {
	var id: Int

	var title: String
	var overview: String

	var posterPath: String?

	var voteAverage: Double
	var releaseDate: String
}
