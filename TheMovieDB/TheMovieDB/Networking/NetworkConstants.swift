//
//  ServicesConstants.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Foundation

struct NetworkURLs {
    static let serverBaseURL = "https://api.themoviedb.org/3/"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/"
    static let discoverMoviesURL = "discover/movie"
    static let searchMoviesURL = "search/movie"
    static let moviePosterImageURL = imagesBaseURL + "w92%@"
    static let movieBackdropImageURL = imagesBaseURL + "w300%@"
}

struct NetworkKyes {
    static let apiKey = "api_key"
    static let lang = "language"
    static let page = "page"
    static let sortBy = "sort_by"
    static let primaryReleaseDateLTE = "primary_release_date.lte"
    static let searchQuery = "query"
}

struct NetworkValues {
    static let apiValue = "4e40447823147cf62d5f10a7b56536fa"
    static let releaseDateDesc = "release_date.desc"
}
