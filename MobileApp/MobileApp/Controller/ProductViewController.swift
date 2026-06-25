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
    private let viewModel: MobileViewModelProtocol
    
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

    
 
    
    
    
    // MARK: - Setup Loader
    
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
