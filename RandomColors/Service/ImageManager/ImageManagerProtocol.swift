//
//  ImageManagerProtocol.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/20/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

protocol ImageManagerProtocol {
    func downloadImageFromURL(_ urlString: String, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?)
}
