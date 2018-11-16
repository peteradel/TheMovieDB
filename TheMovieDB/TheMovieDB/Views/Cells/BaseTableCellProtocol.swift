//
//  BaseTableCellViewModel.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Foundation

protocol BaseTableCellProtocol {
    static var cellIdentifier: String { get }

    func bind<T>(tableCellViewModel: T)
}
