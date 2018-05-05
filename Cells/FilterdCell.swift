//
//  FilterdCell.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit

class FilterdCell: UITableViewCell {

    @IBOutlet weak var imagee: RoundedImage!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIDLabel: UILabel!
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
