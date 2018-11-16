//
//  MovieDetailsViewModel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class MovieDetailsViewModel: MovieTableViewCellModel {
    var backdropURL: URL?
    var rating: String?
    var originalTitle: String?

    override init(movie: Movie) {
        super.init(movie: movie)

        backdropURL = URL(string: String(format: NetworkURLs.movieBackdropImageURL, movie.backdropPath ?? ""))
        rating = String(format: "label_text_rating_value".localized(), movie.voteAverage ?? 0, movie.voteCount ?? 0)
        originalTitle = movie.originalTitle
    }
}
