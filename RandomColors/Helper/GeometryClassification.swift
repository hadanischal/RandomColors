//
//  GeometryClassification.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

enum GeometryClassification: UInt32 {
    case Circle
    case Square

    private static let _count: GeometryClassification.RawValue = {
        var maxValue: UInt32 = 0
        while let _ = GeometryClassification(rawValue: maxValue) {
            maxValue += 1
        }
        return maxValue
    }()

    static func randomGeometry() -> GeometryClassification {
        let rand = arc4random_uniform(_count)
        return GeometryClassification(rawValue: rand)!
    }
}
