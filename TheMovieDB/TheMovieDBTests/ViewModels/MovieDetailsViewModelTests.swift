//
//  MovieDetailsViewModelTests.swift
//  TheMovieDBTests
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import XCTest

class MovieDetailsViewModelTests: XCTestCase {
    var movie: Movie?
    var movieDetailsViewModel: MovieDetailsViewModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movie = Movie(posterPath: "/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg", backdropPath: "/VuukZLgaCrho2Ar8Scl9HtV3yD.jpg", title: "Venom", originalTitle: "Venom", releaseDate: "2018-10-03", overview: "When Eddie Brock acquires the powers of a symbiote, he will have to release his alter-ego \"Venom\" to save his life.", voteAverage: 5.5, voteCount: 10)
        movieDetailsViewModel = MovieDetailsViewModel(movie: movie!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        movie = nil
        movieDetailsViewModel = nil
    }
    
    func testBackdropPath() {
        XCTAssertEqual(movieDetailsViewModel?.backdropURL, URL(string: String(format: NetworkURLs.movieBackdropImageURL, movie?.backdropPath ?? "")))
    }
    
    func testPosterPath() {
        XCTAssertEqual(movieDetailsViewModel?.posterURL, URL(string: String(format: NetworkURLs.moviePosterImageURL, movie?.posterPath ?? "")))
    }
    
    func testTitle() {
        XCTAssertEqual(movieDetailsViewModel?.title, movie?.title)
    }
    
    func testReleaseDate() {
        XCTAssertEqual(movieDetailsViewModel?.releaseDate, movie?.releaseDate)
    }
    
    func testRating() {
        XCTAssertEqual(movieDetailsViewModel?.rating, String(format: "label_text_rating_value".localized(), movie?.voteAverage ?? 0, movie?.voteCount ?? 0))
    }
    
    func testOriginalTitle() {
        XCTAssertEqual(movieDetailsViewModel?.originalTitle, movie?.originalTitle)
    }
    
    func testOverview() {
        XCTAssertEqual(movieDetailsViewModel?.overview, movie?.overview)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
