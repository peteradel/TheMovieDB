//
//  ListResponse.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class ListResponse<T: Codable>: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [T]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
