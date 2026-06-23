//
//  HumanCell.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 6/1/26.
//

import UIKit

class HumanCell: UITableViewCell {
    @IBOutlet weak var humanImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
