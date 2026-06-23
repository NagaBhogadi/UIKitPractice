//
//  Movie.swift
//  CalculatorTest
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

struct Movie {
    let title: String
    let genre: String
    let rating: Double
    let year: Int
}
 
struct MovieFilter {
    func filterByGenre(_ genre: String, from movies: [Movie]) -> [Movie] {
        return movies.filter { $0.genre == genre }
    }
 
    func filterByMinRating(_ rating: Double, from movies: [Movie]) -> [Movie] {
        return movies.filter { $0.rating >= rating }
    }
 
    func filterByYear(_ year: Int, from movies: [Movie]) -> [Movie] {
        return movies.filter { $0.year == year }
    }
}
