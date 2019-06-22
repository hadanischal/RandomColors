//
//  ColoursServiceCallTests.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/8/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import RandomColors

class ColoursServiceCallTests: XCTestCase {

    func testCancelRequest() {
        let service: ColoursServiceCall! = ColoursServiceCall()
        service.fetchConverter(APIConstants.colorsURL) { (_) in
        }
        service.cancelFetchService()
        XCTAssertNil(service.task, "Expected task nil")
    }
}
