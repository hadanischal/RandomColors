//
//  MockColoursServiceCall.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/20/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
@testable import RandomColors

class MockColoursServiceCall: ColoursServiceCallProtocol {
    var fetchedData: [ColoursModel]?
    func fetchConverter(_ urlString: String, completion: @escaping ((Result<[ColoursModel], ErrorResult>) -> Void)) {
        if let data = fetchedData {
            completion(Result.success(data))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No converter")))
        }
    }
}
