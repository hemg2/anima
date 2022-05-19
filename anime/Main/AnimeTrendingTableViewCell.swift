//
//  AnimeTrendingTableViewCell.swift
//  anime
//
//  Created by 1 on 2022/05/13.
//

import UIKit

class AnimeTrendingTableViewCell: UITableViewCell {
    @IBOutlet weak var animePosterImage: UIImageView!
    @IBOutlet weak var animeTitleLabel: UILabel!
    @IBOutlet weak var animeSynopsisLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animePosterImage.layer.cornerRadius = 15
        animePosterImage.layer.borderColor = UIColor.black.cgColor
        animePosterImage.layer.borderWidth = 1
    }

}

