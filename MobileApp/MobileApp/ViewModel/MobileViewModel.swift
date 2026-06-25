//
//  ProductViewModel.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/25/26.
//

import Foundation

protocol MobileViewModelProtocol: AnyObject {
    func fetchMobile(completion: @escaping() -> Void)
    func numberOfMobiles()-> Int
    func Mobile(at index: Int) -> Product
}

class MobileViewModel: MobileViewModelProtocol {
    
    // MARK: - Properties
    
    private var products: [Product] = []
    
    // MARK: - API Call
    
    func fetchMobile(completion: @escaping() -> Void) {
        
        NetworkManager.shared.fetchDataFrom(serverUrl: APIConstants.smartphonesURL){
            [weak self] fetchedMovies in
            defer {
                completion()
            }
            guard let self = self else { return }
            self.products = fetchedMovies
            completion()
        }
    }
    
    // MARK: - Helper Methods
    
    func numberOfMobiles() -> Int {
        return products.count
    }
    func Mobile(at index: Int) -> Product{
        return products[index]
    }
}


