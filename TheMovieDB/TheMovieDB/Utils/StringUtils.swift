//
//  StringUtils.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class StringUtils: NSObject {
    static func isNotEmptyString(string: String?) -> Bool {
        return string != nil && !(trim(stringToTrim: string!).isEmpty)
    }

    static func trim(stringToTrim: String) -> String {
        return stringToTrim.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
