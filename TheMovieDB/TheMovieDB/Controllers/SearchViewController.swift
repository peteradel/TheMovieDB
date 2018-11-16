//
//  SearchViewController.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class SearchViewController: BaseTableViewController<SearchMoviesTableViewModel, MoviesTableViewCell>, UISearchBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initSearchBar()
    }
    
    // MARK: - BaseViewController methods
    
    override func getViewControllerTitle() -> String? {
        return ""
    }
    
    override func isSearchNavigationBarItemEnabled() -> Bool {
        return false
    }
    
    // MARK: - UITableViewDataDelegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = tableViewModel.getCellViewModel(at: indexPath).movie
        let movieDetailsViewController = MovieDetailsViewController(movieDetailsViewModel: MovieDetailsViewModel(movie: movie))
        navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
    
    // MARK: - SearchViewController  methods
    
    func initSearchBar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "placholder_search_movies".localized()
        searchBar.barTintColor = Colors.navigationBarBGColor
        navigationItem.titleView = searchBar
    }
    
    // MARK: - UISearchBarDelegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        (tableViewModel as SearchMoviesTableViewModel).searchQuery = searchBar.text
        searchBar.resignFirstResponder()
    }
}
