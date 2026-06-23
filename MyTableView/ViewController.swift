//
//  ViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/26/26.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
//Mark:- implementing the tableview datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }

}

