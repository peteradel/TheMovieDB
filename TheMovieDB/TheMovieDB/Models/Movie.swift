//
//  Movie.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

struct Movie: Codable {
    var video: Bool?
    var adult: Bool?
    var id: Int?
    var voteCount: Int?
    var voteAverage: Float?
    var popularity: Float?
    var title: String?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var backdropPath: String?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case video
        case adult
        case id
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case popularity
        case title
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
    
    init(posterPath: String, title: String, releaseDate: String, overview: String) {
        self.posterPath = posterPath
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
    }
    
    init(posterPath: String, backdropPath: String, title: String, originalTitle: String, releaseDate: String, overview: String, voteAverage: Float, voteCount: Int) {
        self.init(posterPath: posterPath, title: title, releaseDate: releaseDate, overview: overview)
        
        self.backdropPath = backdropPath
        self.originalTitle = originalTitle
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
