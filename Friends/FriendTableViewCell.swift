//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/7/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
