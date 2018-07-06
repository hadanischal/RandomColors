//
//  ColoursViewCell.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class ColoursViewCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.backgroundColor = UIColor.random
        self.photoImageView?.backgroundColor = UIColor.random

    }
}
