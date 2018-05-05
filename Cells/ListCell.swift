//
//  ListCell.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit
import UICheckbox_Swift
import Kingfisher


class ListCell: UITableViewCell {

    @IBOutlet weak var imagee: RoundedImage!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIDLabel: UILabel!
    @IBOutlet weak var checkedBtn: UICheckbox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateViews(serverData: ServerData){
        self.titleLabel.text = serverData.title!
        self.albumIDLabel.text = String(describing: serverData.albumId!)
        imagee.kf.indicatorType = .activity
        let url = URL(string: serverData.thumbnailUrl!)
        self.imagee.kf.setImage(with: url)
         self.checkedBtn.isSelected = serverData.selected!

    }

}
