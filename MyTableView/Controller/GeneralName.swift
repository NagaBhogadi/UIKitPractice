//
//  GeneralName.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 6/1/26.
//

import UIKit

class GeneralName: UIViewController {
    
    @IBOutlet weak var humanTable: UITableView!
   
    var humanList: [HumanModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.humanList = getHumanList()
        self.humanTable.dataSource = self
        self.humanTable.delegate = self
    }
    func getHumanList() -> [HumanModel] {
        return [
            HumanModel(name: "Rajitha",gender: "Female", email: "nrajitha@gamil.com",humanImage:"person1")
        ]
    }
}

extension  GeneralName: UITableViewDataSource, UITableViewDelegate {
    func tableView (_ Table: UITableView,numberOfRowsInSection Section:Int) -> Int{
        return humanList.count
        
    }
    func tableView(_ _tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = _tableView .dequeueReusableCell(withIdentifier: "HumanCell", for: indexPath) as! HumanCell
        let human = humanList[indexPath.row]
        cell.nameLabel.text = human.name
        cell.genderLabel.text = human.gender
        cell.emailLabel.text = human.email
        cell.humanImage.image = UIImage(named: human.humanImage)
        return cell
    }
}
