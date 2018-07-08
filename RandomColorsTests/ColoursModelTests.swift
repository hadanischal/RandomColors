//
//  ColoursModelTests.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/8/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import RandomColors

class ColoursModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExampleEmptySearchResults() {
        let data = Data()
        let completion : ((Result<ColoursModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseSearchResults(){
        guard let data = FileManager.readJsonFile(forResource: "colors") else {
            XCTAssert(false, "Can't get data from colors.json")
            return
        }
        let completion : ((Result<[ColoursModel], ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid converter")
            case .success(let converter):
                XCTAssert(true, "Expected response value")
                XCTAssertNotNil(converter, "Expected response value")
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeySearchResults() {
        let dictionary = ["testObject" : 123 as AnyObject]
        let result = ColoursModel.parseObject(dictionary: dictionary)
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
    
}
