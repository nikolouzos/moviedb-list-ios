//
//  MovieOverviewCell.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import UIKit

class MovieOverviewCell: UITableViewCell {
	@IBOutlet weak var posterImageView: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieOverview: UILabel!

	/// Sets up the cell for the movie overview with the data provided
	func setup(forMovie movie: Movie) {
		// Populate the texts
		movieTitle.text = movie.title
		movieOverview.text = movie.overview

		// TODO: Load in the image from the image path
	}
}
