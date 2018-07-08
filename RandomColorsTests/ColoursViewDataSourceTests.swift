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

    func testEmptyValueInDataSource() {
        dataSource?.data.value = []
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        XCTAssertEqual(dataSource?.numberOfSections(in: collectionView), 1, "Expected one section in collection view")
        XCTAssertEqual(dataSource?.collectionView(collectionView, numberOfItemsInSection: 50), 60, "Expected 60 cell in collection view")
//        XCTAssertEqual(dataSource?.collectionView(collectionView, numberOfItemsInSection: 0), 0, "Expected no cell in collection view")
    }
    
    func testValueInDataSource() {
        let responseResults:[ColoursModel] = valuesFromJSON()
        dataSource?.data.value = responseResults
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        XCTAssertEqual(dataSource?.numberOfSections(in: collectionView), 1, "Expected one section in table view")
        XCTAssertEqual(dataSource?.collectionView(collectionView, numberOfItemsInSection: 0), 60, "Expected 60 cell in collection view")
//        XCTAssertEqual(dataSource?.collectionView(collectionView, numberOfItemsInSection: 0), responseResults.count, "Expected responseResults.count cell in collection view")
    }
    
    func testValueCell() {
        dataSource?.data.value = valuesFromJSON()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(ColoursViewCell.self, forCellWithReuseIdentifier: "ColoursViewCell")
        let indexPath = IndexPath(row: 0, section: 0)
        guard let _ = dataSource?.collectionView(collectionView, cellForItemAt: indexPath)as? ColoursViewCell else {
            XCTAssert(false, "Expected collectionViewCell class")
            return
        }
    }
 
    func valuesFromJSON() ->[ColoursModel]{
        var responseResults = [ColoursModel]()
        guard let data = FileManager.readJsonFile(forResource: "colors") else {
            XCTAssert(false, "Can't get data from colors.json")
            return responseResults
        }
        let completion : ((Result<[ColoursModel], ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid flickrsample")
            case .success(let converter):
                print(converter)
                responseResults = converter
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
        return responseResults
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

