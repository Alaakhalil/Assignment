//
//  ListCell.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit
import UICheckbox_Swift

class ListCell: UITableViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIDLabel: UILabel!
    @IBOutlet weak var checkedBtn: UICheckbox!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   

}
