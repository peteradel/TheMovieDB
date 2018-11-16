//
//  DateUtils.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Foundation

struct DateUtils {
    static let movieReleaseDateFormat = "yyyy-MM-dd"
    
    static func formatDate(dateToFormat: Date, newDateFormat: String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = newDateFormat
        return dateFormatter.string(from: dateToFormat)
    }
}
