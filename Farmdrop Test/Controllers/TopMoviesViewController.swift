//
//  TopMoviesViewController.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 28/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import UIKit

class TopMoviesViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var movies: Movies = []

	override func viewDidLoad() {
		super.viewDidLoad()

		// Change the title to large
		navigationController?.navigationBar.prefersLargeTitles = true

		// Remove the tableView footer
		tableView.tableFooterView = UIView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		// Set the Networking delegate
		Network.shared.delegate = self

		// Get the top movies each time the VC comes into view
		Network.shared.getTopMovies()
	}
}

// MARK: - TableView Customization
extension TopMoviesViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(
			withIdentifier: "movieOverviewCell", for: indexPath) as? MovieOverviewCell,
			indexPath.row < movies.count {

			let movie = movies[indexPath.row]

			cell.setup(forMovie: movie)

			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - Network Delegate
extension TopMoviesViewController: NetworkDelegate {
	func got(topMovies: TopMovies?, or networkError: NetworkError?) {
		if let movies = topMovies?.movies {

			// Set the movies
			self.movies = movies

			// Reload the tableView data
			tableView.reloadData()
		}
	}
}
