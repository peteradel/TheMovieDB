//
//  SearchMoviesTableViewModel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class SearchMoviesTableViewModel: NSObject, BaseTableViewModelProtocol {
    typealias TableViewCellModel = MovieTableViewCellModel
    
    var page: Int = 1
    
    var isLoading: Observable<Bool> = Observable<Bool>(value: false)
    
    var isLoadingDataEnabled: Bool = false
    
    var isLoadMoreEnabled: Bool = true
    
    var tableViewCellModels: [MovieTableViewCellModel] = [MovieTableViewCellModel]()
    
    var searchQuery: String? {
        didSet {
            // Check if the search query is not empty
            // Reset page counter
            // Reintialize table view models array
            // Enable table view loading
            if StringUtils.isNotEmptyString(string: searchQuery) {
                page = 1
                tableViewCellModels = [MovieTableViewCellModel]()
                isLoadingDataEnabled = true
            }
            
            loadData()
        }
    }
    
    func loadData() {
        if isLoadingDataEnabled && !isLoading.value {
            isLoading.value = true
            
            MovieServices.searchMovies(page: page, searchQuery: searchQuery!) { [weak self] (movies: [Movie]?) in
                
                if let movies = movies, movies.count > 0 {
                    for movie in movies {
                        self?.tableViewCellModels.append(MovieTableViewCellModel(movie: movie))
                    }
                } else {
                    // Disable load more if response is empty
                    self?.isLoadMoreEnabled = false
                }
                
                self?.isLoading.value = false
            }
        }
    }
}
