//
//  ProductViewController.swift
//  MobileApp
//
//  Created by Naga Rajitha Bhogadi on 6/23/26.
//

import UIKit

// MARK: - Mobile View Controller

final class ProductViewController: UIViewController, UISearchResultsUpdating {
    
    
    
    // MARK: - UI Components
    
    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Properties
    //   TODO: -  need to replace with dependency injection
    
    private let viewModel: MobileViewModelProtocol
    
    // MARK: - Initializer
    
    init(viewModel: MobileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Smartphones"
        view.backgroundColor = .white
        setupSearchBar()
        setupTableView()
        setupActivityIndicator()
        showLoader()
        viewModel.fetchMobile {
            [weak self]  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.hideLoader()
            }
            
        }
        
    }
    
    //    MARK: - Setup SearchBar
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
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
    
    // MARK: - Setup ActivityIndicator
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .systemRed
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        viewModel.searchMobile(with: searchText)
        tableView.reloadData()
    }
}

//MARK: - Progress Method

extension ProductViewController {
    func showLoader() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    func hideLoader() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
    func reloadTableView() {
        tableView.reloadData()
    }
}
    
    // MARK: - UITableViewDataSource
    
    extension ProductViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.numberOfMobiles()
        }
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductCell.identifier,
                for: indexPath
            ) as? ProductCell else {
                return UITableViewCell()
            }
            cell.configure(with: viewModel.Mobile(at: indexPath.row))
            return cell
        }
    }

