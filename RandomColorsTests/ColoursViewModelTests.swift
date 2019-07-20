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

    var viewModel: ColoursViewModel?
    var dataSource: GenericDataSource<ColoursModel>?
    private var mockService: MockColoursServiceCall?

    override func setUp() {
        super.setUp()
        self.mockService = MockColoursServiceCall()
        self.dataSource = GenericDataSource<ColoursModel>()
        self.viewModel = ColoursViewModel(service: mockService, dataSource: dataSource)
    }

    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.mockService = nil
        super.tearDown()
    }

    func testfetchData() {
        mockService?.fetchedData = [MockData().getColoursModel()]
        viewModel?.fetchServiceCall { (result) in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default: break
            }
        }
    }

    func testfetchNoDatas() {
        mockService?.fetchedData = nil
        viewModel?.fetchServiceCall { (result) in
            switch result {
            case .success :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }
}
