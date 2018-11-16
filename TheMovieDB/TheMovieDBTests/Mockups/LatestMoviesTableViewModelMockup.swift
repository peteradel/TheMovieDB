//
//  LatestMoviesTableViewModelMockup.swift
//  TheMovieDBTests
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class LatestMoviesTableViewModelMockup: LatestMoviesTableViewModel {
    public override func loadData() {
        // Check if table view already loading data
        if !isLoading.value {
            isLoading.value = true
            
            let movie = Movie(posterPath: "/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg", title: "Venom", releaseDate: "2018-10-03", overview: "When Eddie Brock acquires the powers of a symbiote, he will have to release his alter-ego \"Venom\" to save his life.")
            
            tableViewCellModels.append(MovieTableViewCellModel(movie: movie))
            
            isLoading.value = false
        }
    }
}
