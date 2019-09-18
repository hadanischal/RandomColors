//
//  Parceable.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(data: Data) -> Result<[Self], ErrorResult>
}

final class ParserHelper {
    static func parse<T: Parceable>(data: Data, completion: (Result<[T], ErrorResult>) -> Void) {
        switch T.parseObject(data: data) {
        case .failure(let error):
            completion(.failure(error))
        case .success(let newModel):
            completion(.success(newModel))
        }
    }
}
