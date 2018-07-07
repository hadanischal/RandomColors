//
//  ColoursServiceCall.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

protocol ColoursServiceCallProtocol: class {
    func fetchConverter(_ urlString: String, completion: @escaping ((Result<[ColoursModel], ErrorResult>) -> Void))
}

final class ColoursServiceCall: NetworkHandler, ColoursServiceCallProtocol {
    static let shared = ColoursServiceCall()
    var task : URLSessionTask?
    
    func fetchConverter(_ urlString: String, completion: @escaping ((Result<[ColoursModel], ErrorResult>) -> Void)) {
        self.cancelFetchService()
        task = NetworkService().loadData(urlString: urlString, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

