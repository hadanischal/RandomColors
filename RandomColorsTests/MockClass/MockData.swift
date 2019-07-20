//
//  MockData.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/20/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import XCTest
@testable import RandomColors

class MockData {

    func getColoursData() -> Data {
        guard let data = self.readJson(forResource: "colors") else {
            XCTAssert(false, "Can't get data from colors.json")
            return Data()
        }
        return data
    }

    func getColoursModel() -> ColoursModel {
        var responseResults: ColoursModel!
        guard let data = self.readJson(forResource: "colors") else {
            XCTAssert(false, "Can't get data from colors.json")
            return ColoursModel.empty
        }
        let completion: ((Result<[ColoursModel], ErrorResult>) -> Void) = { result in
            switch result {
            case .failure:
                XCTAssert(false, "Expected valid converter")
            case .success(let result):
                responseResults = result[0]
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
        return responseResults
    }

    func getFeedslist() -> TemplateModel {
        guard let list = getColoursModel().template else {
            return TemplateModel(title: nil, url: nil)
        }
        return list
    }
}

extension MockData {
    func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch (_) {
            XCTFail("unable to read json")
            return nil
        }
    }
}
