//
//  FirstOneViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/27/26.
//

import UIKit

struct Product {
    let name: String
    let price: String
    let description: String
    let rating: String
}

class FirstOneViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!

    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        products = getProductList()

        TableView.dataSource = self
        TableView.delegate = self
    }
}

// MARK: - TableView DataSource

extension FirstOneViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)

        let product = products[indexPath.row]

        cell.textLabel?.text = product.name

        return cell
    }
}

// MARK: - TableView Delegate

extension FirstOneViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedProduct = products[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let secondVC = storyboard.instantiateViewController(
            withIdentifier: "SecondOneViewController"
        ) as! SecondOneViewController

        secondVC.productName = selectedProduct.name
        secondVC.productPrice = selectedProduct.price
        secondVC.productDescription = selectedProduct.description
        secondVC.productRating = selectedProduct.rating

        navigationController?.pushViewController(secondVC, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Product Data

extension FirstOneViewController {

    func getProductList() -> [Product] {

        var productList: [Product] = []

        let product1 = Product(
            name: "iPhone 17 Pro",
            price: "$1199",
            description: "Apple latest iPhone with advanced camera.",
            rating: "4.8"
        )

        let product2 = Product(
            name: "MacBook Pro",
            price: "$1999",
            description: "Powerful laptop for coding and professional work.",
            rating: "4.9"
        )

        let product3 = Product(
            name: "iPad Air",
            price: "$599",
            description: "Lightweight tablet for study and entertainment.",
            rating: "4.6"
        )

        let product4 = Product(
            name: "Apple Watch",
            price: "$399",
            description: "Smart watch for fitness and health tracking.",
            rating: "4.5"
        )

        let product5 = Product(
            name: "AirPods Pro",
            price: "$249",
            description: "Wireless earbuds with noise cancellation.",
            rating: "4.7"
        )

        productList.append(product1)
        productList.append(product2)
        productList.append(product3)
        productList.append(product4)
        productList.append(product5)

        return productList
    }
}
