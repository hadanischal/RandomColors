//
//  ColoursModel.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

struct ColoursModel {
    let count: Int?
    let next: String?
    let previous: String?
}

extension ColoursModel : Parceable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<ColoursModel, ErrorResult> {
        print(dictionary)
        if let next = dictionary["next"] as? String,
            let previous = (dictionary["next"] ?? "unknown" as AnyObject) as? String,
            let count = dictionary["count"] as? Int,
            let personsArray = dictionary["results"] as? [AnyObject]{
//            var responseResults = [PersonModel]()
//            for personJSON in personsArray {
//                let currentData = PersonModel(dictionary: personJSON as! [String:Any])
//                responseResults.append(currentData)
//            }
//            let conversion = CharactersModel(count: count, next: next, previous: previous, results: responseResults)
//            return Result.success(conversion)
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))

        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}
