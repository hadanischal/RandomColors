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
    var coloursValue: ColoursModel? {
        didSet {
            guard let data = coloursValue else {
                return
            }
            if let _  = data.template,
                 let url = data.imageUrl {
                ImageManager.sharedInstance.downloadImageFromURL(url) { (success, image) -> Void in
                    if success && image != nil {
                        self.photoImageView?.image = image
                    }
                }
            } else {
                if let hex = data.hex {
                    self.photoImageView?.backgroundColor = UIColor(hex: "#" + hex.lowercased())
                } else {
                    self.photoImageView?.backgroundColor = UIColor.random
                }
            }
        }
    }

    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView?.backgroundColor = UIColor.white //UIColor.random
        self.photoImageView?.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        switch GeometryClassification.randomGeometry() {
        case .Circle:
            self.setCircularImageView()
        case .Square:
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

//    override var isSelected: Bool{
//        didSet{
//            if self.isSelected{
//                if let data = coloursValue,
//                    let hex = data.hex{
//                    self.photoImageView?.backgroundColor = UIColor(hex:"#" + hex.lowercased())
//                }else{
//                    self.photoImageView?.backgroundColor = UIColor.random
//                }
//            }else{
//                self.photoImageView?.backgroundColor = UIColor.lightGray
//            }
//        }
//    }
