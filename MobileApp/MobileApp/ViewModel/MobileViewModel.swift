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
    func searchMobile(with searchText: String)
}

class MobileViewModel: MobileViewModelProtocol {
    
    // MARK: - Properties
    
    private var products: [Product] = []
    private var filteredProducts: [Product] = []
    
    // MARK: - API Call
    
    func fetchMobile(completion: @escaping() -> Void) {
        
        NetworkManager.shared.fetchDataFrom(serverUrl: APIConstants.smartphonesURL){
            [weak self] fetchedMovies in
            defer {
                completion()
            }
            guard let self = self else { return }
            self.products = fetchedMovies
            self.filteredProducts = fetchedMovies
            completion()
        }
    }
    
    // MARK: - Helper Methods
    
    func numberOfMobiles() -> Int {
        return filteredProducts.count
    }
    func Mobile(at index: Int) -> Product{
        return filteredProducts[index]
    }
    func searchMobile(with searchText: String) {
        if searchText.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { movie in movie.title.localizedStandardContains(searchText)}
        }
    }
}


