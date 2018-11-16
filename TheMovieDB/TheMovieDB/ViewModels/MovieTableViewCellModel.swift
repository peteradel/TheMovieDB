//
//  MovieTableViewCellModel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class MovieTableViewCellModel {
    var movie: Movie
    
    var posterURL: URL?
    var title: String?
    var releaseDate: String?
    var overview: String?
    
    init(movie: Movie) {
        self.movie = movie
        
        posterURL = URL(string: String(format: NetworkURLs.moviePosterImageURL, movie.posterPath ?? ""))
        title = movie.title
        releaseDate = movie.releaseDate
        overview = movie.overview
    }
}
