//
//  ColoursViewModelProtocol.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/20/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol ColoursViewModelProtocol {
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set}
}
