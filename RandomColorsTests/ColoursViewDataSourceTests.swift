//
//  ColoursViewDataSourceTests.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/8/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import RandomColors

class ColoursViewDataSourceTests: XCTestCase {
    var dataSource : ColoursViewDataSource?
    
    override func setUp() {
        super.setUp()
        dataSource = ColoursViewDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


extension FileManager {
    static func readJsonFile(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: ColoursViewDataSourceTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
            }
        }
        return nil
    }
}

