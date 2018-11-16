//
//  BaseTableViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Foundation

protocol BaseTableViewModelProtocol: NSObjectProtocol {
    associatedtype TableViewCellModel
    
    // Hold current page value and will be increment dynamic incase loadMore more called
    var page: Int { get set }
    
    // Observe this value to show or hide progress
    // Or reload table view data after finish loading
    var isLoading: Observable<Bool> { get set }
    
    // Set this property to true or false based on table view logic
    var isLoadingDataEnabled: Bool { get set }
    
    // Set this property to true or false to enable or disable load more functionality
    var isLoadMoreEnabled: Bool { get set }
    
    // Array holds all table view cell models to use ex: (cellForRow or didSelectRow)
    var tableViewCellModels: [TableViewCellModel] { get set }
    
    // Call this function each time you want table view to load data
    // Recommended first call in viewDidLoad
    // Or after any update in table view logic
    func loadData()
}

extension BaseTableViewModelProtocol {
    var numberOfRows: Int {
        return tableViewCellModels.count
    }
    
    func loadMore() {
        page += 1
        loadData()
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TableViewCellModel {
        return tableViewCellModels[indexPath.row]
    }
}
