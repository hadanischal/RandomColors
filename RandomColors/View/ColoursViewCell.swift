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
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.photoImageView?.backgroundColor = UIColor.random
            }else{
                self.photoImageView?.backgroundColor = UIColor.lightGray
            }
        }
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView?.backgroundColor = UIColor.random
        self.photoImageView?.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch GeometryClassification.randomGeometry() {
        case .Circle:
            self.setCircularImageView()
        case .Square:
            self.setSquareImageView()
        case .Triangle:
            self.setSquareImageView()
        }
    }
    
    func setCircularImageView() {
        self.photoImageView?.layer.cornerRadius = CGFloat(roundf(Float((self.photoImageView?.frame.size.width)! / 2.0)))
    }
    func setSquareImageView() {
        self.photoImageView?.layer.cornerRadius = 0.00
    }
}


