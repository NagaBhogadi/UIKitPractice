//
//  ProductViewController.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/23/26.
//

import UIKit
// MARK: - Product View Controller

final class ProductViewController: UIViewController {
    
    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var products: [Product] = []
    
    //    MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Smartphones"
        view.backgroundColor = .white
        
        setupTableView()
        setupLoader()
        fetchProducts()
        
    }
    
    //    MARK: - Set up TableView
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        tableView.rowHeight = 130
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //    MARK: - API Call
    
    private func fetchProducts() {
        activityIndicator.startAnimating()
        NetworkManager.shared.fetchDataFrom( serverUrl: APIConstants.smartphonesURL) { [weak self] fetchedProducts in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                print("Products count:", fetchedProducts.count)
                self.products = fetchedProducts
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    
    //MARK: -Setup loader
    
    private func setupLoader() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductCell.identifier,
            for: indexPath
        ) as? ProductCell else {
            return UITableViewCell()
        }
        cell.configure(with: products[indexPath.row])
        return cell
    }
}
