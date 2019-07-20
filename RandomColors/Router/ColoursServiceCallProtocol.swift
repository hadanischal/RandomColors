//
//  ColoursServiceCallProtocol.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/20/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol ColoursServiceCallProtocol: class {
    func fetchConverter(_ urlString: String, completion: @escaping ((Result<[ColoursModel], ErrorResult>) -> Void))
}
