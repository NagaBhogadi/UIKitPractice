//
//  ViewController.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/23/26.
//

import UIKit

protocol NetworkProtocol {
    func fetchDataFrom(serverUrl: String, completion: @escaping ([Product]) -> Void )
}

final class NetworkManager: NetworkProtocol, Sendable {
    static let shared: NetworkManager = NetworkManager()
    private init (){}
    
    func fetchDataFrom(
    serverUrl: String,
    completion: @escaping  ([Product]) -> Void
    ){
        guard let serverURL = URL(string: serverUrl) else {
            print("Server URL is invalid")
            // we need to return something
            completion([])
            return
        }
        
        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { data, response, error in
            // TODO: - code goes here
            
            if error != nil {
                print("Unable to fetch data from server, \(error!.localizedDescription)")
                completion([])
                return
            }
            
            guard let receivedData = data else {
                print("Fetched data is nil")
                completion([])
                return
            }
            
            
//MARK: -  parse the data into the model
            
            do {
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: receivedData)
                print(productResponse.products.count)
                completion(productResponse.products)
            } catch {
                print("Unable to parse the data into the model", error)
                completion([])
            }
        }
        .resume()
    }
}
 



