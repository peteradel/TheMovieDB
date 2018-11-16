//
//  MovieServices.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class MovieServices {
    static func loadLatestMovies(page: Int, completionHandler: @escaping ([Movie]?) -> Void) {
        let maxReleaseDate = DateUtils.formatDate(dateToFormat: Date(), newDateFormat: DateUtils.movieReleaseDateFormat)
        
        NetworkManager.request(request: MovieRequests.latestMovies(page: page, sortBy: NetworkValues.releaseDateDesc, releaseDate: maxReleaseDate), withResponseType: ListResponse<Movie>.self) { (listResponse: ListResponse<Movie>?) in
            completionHandler(listResponse?.results)
        }
    }
    
    static func searchMovies(page: Int, searchQuery: String, completionHandler: @escaping ([Movie]?) -> Void) {
        NetworkManager.request(request: MovieRequests.searchMovies(page: page, searchQuery: searchQuery), withResponseType: ListResponse<Movie>.self) { (listResponse: ListResponse<Movie>?) in
            completionHandler(listResponse?.results)
        }
    }
}
