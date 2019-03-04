//
//  ResultTableViewCell.swift
//  WowCompanion
//
//  Created by Joseph Storer on 3/2/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRealm: UILabel!
    @IBOutlet weak var playerIcon: UIImageView!
    @IBOutlet weak var plearerDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
