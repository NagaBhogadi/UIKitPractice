//
//  SecondOneViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/27/26.
//
import UIKit

class SecondOneViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!

    var productName: String = ""
    var productPrice: String = ""
    var productDescription: String = ""
    var productRating: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center

        detailLabel.text = """
        Product Name: \(productName)

        Price: \(productPrice)

        Description:
        \(productDescription)

        Rating: \(productRating)
        """
    }
}
