//
//  ColoursViewModelTests.swift
//  RandomColorsTests
//
//  Created by Nischal Hada on 7/8/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import RandomColors

class ColoursViewModelTests: XCTestCase {
    fileprivate class MockPhotosServiceCall: ColoursServiceCallProtocol {
        var fetchedData: [ColoursModel]?
        func fetchConverter(_ urlString: String, completion: @escaping ((Result<[ColoursModel], ErrorResult>) -> Void)) {
            if let data = fetchedData {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorResult.custom(string: "No converter")))
            }
        }
    }

    var viewModel: ColoursViewModel?
    var dataSource: GenericDataSource<ColoursModel>?
    fileprivate var service: MockPhotosServiceCall?

    override func setUp() {
        super.setUp()
        self.service = MockPhotosServiceCall()
        self.dataSource = GenericDataSource<ColoursModel>()
        self.viewModel = ColoursViewModel(service: service, dataSource: dataSource)
    }

    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }

    func testfetchData() {
        let dictionary: [String: Any] = [:]
        guard let result = ColoursModel.init(json: dictionary)else {
            XCTAssert(false, "ViewModel should not be able to fetch without ColoursModel")
            return
        }
        service?.fetchedData = [result]
        viewModel?.fetchServiceCall { (result) in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default: break
            }
        }
    }

    func testfetchNoDatas() {
        service?.fetchedData = nil
        viewModel?.fetchServiceCall { (result) in
            switch result {
            case .success :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }
}
