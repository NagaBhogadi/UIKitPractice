//
//  Model.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/23/26.
//

import Foundation

// MARK: - Movie Response

struct ProductResponse: Decodable{
    let products: [Product]
}

// MARK: - Movie Model

struct Product: Decodable {
    
    // MARK: - Properties
    
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let thumbnail: String?
    let images: [String]
}
