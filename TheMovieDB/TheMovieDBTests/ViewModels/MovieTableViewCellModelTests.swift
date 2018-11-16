//
//  MovieTableViewCellModelTests.swift
//  TheMovieDBTests
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import XCTest

class MovieTableViewCellModelTests: XCTestCase {
    var movie: Movie?
    var movieTableViewCellModel: MovieTableViewCellModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movie = Movie(posterPath: "/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg", title: "Venom", releaseDate: "2018-10-03", overview: "When Eddie Brock acquires the powers of a symbiote, he will have to release his alter-ego \"Venom\" to save his life.")
        movieTableViewCellModel = MovieTableViewCellModel(movie: movie!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        movie = nil
        movieTableViewCellModel = nil
    }
    
    func testPosterPath() {
        XCTAssertEqual(movieTableViewCellModel?.posterURL, URL(string: String(format: NetworkURLs.moviePosterImageURL, movie?.posterPath ?? "")))
    }
    
    func testTitle() {
        XCTAssertEqual(movieTableViewCellModel?.title, movie?.title)
    }
    
    func testReleaseDate() {
        XCTAssertEqual(movieTableViewCellModel?.releaseDate, movie?.releaseDate)
    }
    
    func testOverview() {
        XCTAssertEqual(movieTableViewCellModel?.overview, movie?.overview)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
