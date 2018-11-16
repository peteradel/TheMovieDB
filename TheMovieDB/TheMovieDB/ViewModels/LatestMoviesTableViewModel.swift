//
//  MoviesTableViewModel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class LatestMoviesTableViewModel: NSObject, BaseTableViewModelProtocol {
    typealias TableViewCellModel = MovieTableViewCellModel
    
    var page: Int = 1
    
    var isLoading = Observable<Bool>(value: false)
    
    var isLoadingDataEnabled: Bool = true
    
    var isLoadMoreEnabled: Bool = true
    
    var tableViewCellModels: [MovieTableViewCellModel] = [MovieTableViewCellModel]()
    
    public func loadData() {
        // Check if table view already loading data
        if !isLoading.value {
            isLoading.value = true
            
            MovieServices.loadLatestMovies(page: page) { [weak self] (movies: [Movie]?) in
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
