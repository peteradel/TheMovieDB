//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class LatestMoviesTableViewController: BaseTableViewController<LatestMoviesTableViewModel, MoviesTableViewCell> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - BaseViewController methods
    
    override func getViewControllerTitle() -> String? {
        return "view_controller_title_latest_movies".localized()
    }
    
    // MARK: - UITableViewDataDelegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = tableViewModel.getCellViewModel(at: indexPath).movie
        let movieDetailsViewController = MovieDetailsViewController(movieDetailsViewModel: MovieDetailsViewModel(movie: movie))
        navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}
