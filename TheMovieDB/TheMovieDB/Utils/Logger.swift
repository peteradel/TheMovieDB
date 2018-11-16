//
//  Logger.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Foundation

struct Logger {
    static func logDebug(message: Any, filename: String = #file, fromMethod: String = #function, fromLine: Int = #line) {
        print("The message is: \(message) from file: \(filename) from method: \(fromMethod) from line: \(fromLine)")
    }
    
    static func logException(exception: Any, filename: String = #file, fromMethod: String = #function, fromLine: Int = #line) {
        print("The exception is: \(exception) from file: \(filename) from method: \(fromMethod) from line: \(fromLine)")
    }
}
