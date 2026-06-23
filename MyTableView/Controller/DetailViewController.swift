//
//  DetailsViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/27/26.
//
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!

    var selectedData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        detailLabel.text = selectedData
    }
}
