//
//  MovieDetailsViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Peter Sorial on 11/15/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import XCTest

class MovieDetailsViewControllerTests: XCTestCase {
    var movie: Movie?
    var movieDetailsViewModel: MovieDetailsViewModel?
    var movieDetailsViewController: MovieDetailsViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movie = Movie(posterPath: "/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg", backdropPath: "/VuukZLgaCrho2Ar8Scl9HtV3yD.jpg", title: "Venom", originalTitle: "Venom", releaseDate: "2018-10-03", overview: "When Eddie Brock acquires the powers of a symbiote, he will have to release his alter-ego \"Venom\" to save his life.", voteAverage: 5.5, voteCount: 10)
        movieDetailsViewModel = MovieDetailsViewModel(movie: movie!)
        movieDetailsViewController = MovieDetailsViewController(movieDetailsViewModel: movieDetailsViewModel!)
        
        movieDetailsViewController?.loadView()
        movieDetailsViewController?.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        movie = nil
        movieDetailsViewModel = nil
        movieDetailsViewController = nil
    }
    
    func testTitle() {
        XCTAssertEqual(movieDetailsViewController?.movieTitleLabel.text, movie?.title)
    }
    
    func testReleaseDate() {
        XCTAssertEqual(movieDetailsViewController?.movieReleaseDateLabel.text, movie?.releaseDate)
    }
    
    func testRating() {
        XCTAssertEqual(movieDetailsViewController?.movieRatingLabel.text, String(format: "label_text_rating_value".localized(), movie?.voteAverage ?? 0, movie?.voteCount ?? 0))
    }
    
    func testOriginalTitle() {
        XCTAssertEqual(movieDetailsViewController?.movieOriginalTitleLabel.text, movie?.originalTitle)
    }
    
    func testOverview() {
        XCTAssertEqual(movieDetailsViewController?.movieOverviewValueLabel.text, movie?.overview)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
