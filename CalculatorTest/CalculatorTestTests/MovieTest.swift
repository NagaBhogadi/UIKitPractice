//
//  MovieTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest   // Replace with your app/project name

final class MovieFilterTests: XCTestCase {
    
    var movieFilter: MovieFilter!
    var movies: [Movie]!
    
    override func setUpWithError() throws {
        movieFilter = MovieFilter()
        
        movies = [
            Movie(title: "Inception", genre: "Sci-Fi", rating: 8.8, year: 2010),
            Movie(title: "Interstellar", genre: "Sci-Fi", rating: 8.6, year: 2014),
            Movie(title: "Titanic", genre: "Romance", rating: 7.9, year: 1997),
            Movie(title: "The Dark Knight", genre: "Action", rating: 9.0, year: 2008),
            Movie(title: "Avatar", genre: "Sci-Fi", rating: 7.8, year: 2009)
        ]
    }
    
    override func tearDownWithError() throws {
        movieFilter = nil
        movies = nil
    }
    
    func testFilterByGenreReturnsOnlyMatchingMovies() {
        let result = movieFilter.filterByGenre("Sci-Fi", from: movies)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertTrue(result.allSatisfy { $0.genre == "Sci-Fi" })
    }
    
    func testFilterByGenreWithNoMatchReturnsEmptyArray() {
        let result = movieFilter.filterByGenre("Horror", from: movies)
        
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterByMinRatingReturnsMoviesAboveThreshold() {
        let result = movieFilter.filterByMinRating(8.5, from: movies)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertTrue(result.allSatisfy { $0.rating >= 8.5 })
    }
    
    func testFilterWithRatingZeroReturnsAllMovies() {
        let result = movieFilter.filterByMinRating(0.0, from: movies)
        
        XCTAssertEqual(result.count, movies.count)
    }
    
    func testFilterByYearReturnsCorrectMovies() {
        let result = movieFilter.filterByYear(2010, from: movies)
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.title, "Inception")
        XCTAssertEqual(result.first?.year, 2010)
    }
    
    func testFilteringEmptyArrayReturnsEmptyArray() {
        let emptyMovies: [Movie] = []
        
        let genreResult = movieFilter.filterByGenre("Sci-Fi", from: emptyMovies)
        let ratingResult = movieFilter.filterByMinRating(8.0, from: emptyMovies)
        let yearResult = movieFilter.filterByYear(2010, from: emptyMovies)
        
        XCTAssertTrue(genreResult.isEmpty)
        XCTAssertTrue(ratingResult.isEmpty)
        XCTAssertTrue(yearResult.isEmpty)
    }
}
