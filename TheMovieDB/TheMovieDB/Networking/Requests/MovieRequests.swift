//
//  MovieRequests.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Alamofire
import Foundation

enum MovieRequests: URLRequestBuilder {
    case latestMovies(page: Int, sortBy: String, releaseDate: String)
    case searchMovies(page: Int, searchQuery: String)
    
    // MARK: - Paths
    
    var path: String {
        switch self {
        case .latestMovies:
            return NetworkURLs.discoverMoviesURL
            
        case .searchMovies:
            return NetworkURLs.searchMoviesURL
        }
    }
    
    // MARK: - Parameters
    
    var params: Parameters? {
        var params = defaultParams
        
        switch self {
        case .latestMovies(let page, let sortBy, let releaseDate):
            params[NetworkKyes.page] = page
            params[NetworkKyes.sortBy] = sortBy
            params[NetworkKyes.primaryReleaseDateLTE] = releaseDate
            
        case .searchMovies(let page, let searchQuery):
            params[NetworkKyes.page] = page
            params[NetworkKyes.searchQuery] = searchQuery
        }
        
        print("==>Params: \(params)")
        
        return params
    }
    
    // MARK: - Methods
    
    var method: HTTPMethod {
        switch self {
        case .latestMovies, .searchMovies:
            return .get
        }
    }
}
