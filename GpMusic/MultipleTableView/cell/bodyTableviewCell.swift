//
//  bodyTableviewCell.swift
//  MultipleTableView
//
//  Created by Raihan on 4/18/19.
//  Copyright © 2019 Raihan. All rights reserved.
//

import UIKit

class bodyTableviewCell: UITableViewCell {
    @IBOutlet weak var bodyImage: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
