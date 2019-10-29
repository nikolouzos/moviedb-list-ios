//
//  LoadableImage.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import UIKit

/// This protocol handles loading images using the AF image
protocol LoadableImage {
	func loadPoster(from movie: Movie, in imageView: UIImageView)
}

// MARK: - Default Implementation
extension LoadableImage {

	/// Sets the poster image to the imageView provided
	func loadPoster(from movie: Movie, in imageView: UIImageView) {
		if let posterUrl = movie.posterUrl {
			imageView.af_setImage(withURL: posterUrl)
			imageView.contentMode = .scaleAspectFit

		} else {
			imageView.image = #imageLiteral(resourceName: "image_not_found")
			imageView.contentMode = .scaleAspectFill
		}
	}
}
