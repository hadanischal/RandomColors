//
//  ColoursViewModel.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

class ColoursViewModel: ColoursViewModelProtocol {
    // MARK: - Input
    weak var dataSource: GenericDataSource<ColoursModel>?
    private var service: ColoursServiceCallProtocol?

    // MARK: - Output
    var onErrorHandling: ((ErrorResult?) -> Void)?

    init(service: ColoursServiceCallProtocol? = ColoursServiceCall.shared, dataSource: GenericDataSource<ColoursModel>?) {
        self.dataSource = dataSource
        self.service = service
    }

    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {

        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        var endpoint = APIConstants.baseURLString

        switch GeometryClassification.randomGeometry() {
        case .circle:
            endpoint = APIConstants.colorsURL
        case .square:
            endpoint = APIConstants.patternsURL
        }

        service.fetchConverter(endpoint) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self.dataSource?.data.value = converter
                    completion?(Result.success(true))
                case .failure(let error) :
                    print("Parser error \(error)")
                    self.onErrorHandling?(error)
                    completion?(Result.failure(error))
                }
            }
        }
    }

}
