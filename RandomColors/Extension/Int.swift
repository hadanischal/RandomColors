//
//  Int.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

extension Int {
    static let max = 10
    static let min = 1
    static let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
}

