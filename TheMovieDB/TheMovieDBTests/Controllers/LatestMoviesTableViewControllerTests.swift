//
//  LatestMoviesTableViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import XCTest

class LatestMoviesTableViewControllerTests: XCTestCase {
    var latestMoviesTableViewModelMockup: LatestMoviesTableViewModelMockup?
    var latestMoviesTableViewController: LatestMoviesTableViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        latestMoviesTableViewModelMockup = LatestMoviesTableViewModelMockup()
        latestMoviesTableViewController = LatestMoviesTableViewController(tableViewModel: latestMoviesTableViewModelMockup!)
        
        latestMoviesTableViewController?.loadView()
        latestMoviesTableViewController?.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        latestMoviesTableViewModelMockup = nil
        latestMoviesTableViewController = nil
    }
    
    func testHasTableView() {
        XCTAssertNotNil(latestMoviesTableViewController?.tableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(latestMoviesTableViewController?.tableView.dataSource)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(latestMoviesTableViewController?.tableView.delegate)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue((latestMoviesTableViewController?.conforms(to: UITableViewDataSource.self))!)
        XCTAssertTrue((latestMoviesTableViewController?.responds(to: #selector(latestMoviesTableViewController?.tableView(_:numberOfRowsInSection:))))!)
        XCTAssertTrue((latestMoviesTableViewController?.responds(to: #selector(latestMoviesTableViewController?.tableView(_:cellForRowAt:))))!)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue((latestMoviesTableViewController?.conforms(to: UITableViewDelegate.self))!)
        XCTAssertTrue((latestMoviesTableViewController?.responds(to: #selector(latestMoviesTableViewController?.tableView(_:didSelectRowAt:))))!)
    }
    
    func testTableViewNumberOfSections() {
        XCTAssertEqual(latestMoviesTableViewController?.tableView.numberOfSections, 1)
    }
    
    func testTableViewNumberOfRows() {
        XCTAssertEqual(latestMoviesTableViewController?.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
