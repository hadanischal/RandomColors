//
//  ColoursViewDataSource.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class ColoursViewDataSource: GenericDataSource<Any> {
    
}
