//
//  ColoursModel.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit
//swiftlint:disable line_length
struct ColoursModel: Codable {
    let id: Int?
    let title: String?
    let userName: String?
    let numViews: Int?
    let numVotes: Int?
    let numComments: Int?
    let numHearts: Int?
    let rank: Int?
    let dateCreated: String?
    //colours
    let hex: String?
    let description: String?
    let url: String?
    let imageUrl: String?
    let badgeUrl: String?
    let apiUrl: String?
    //patterns
    let colors: [String]?
    let template: TemplateModel?
 }

extension ColoursModel: Parceable {
    static func parseObject(data: Data) -> Result<[ColoursModel], ErrorResult> {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode([ColoursModel].self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse ColoursModel results"))
        }
    }
}

extension ColoursModel {
    static var empty: ColoursModel {
        return ColoursModel(id: nil, title: "title", userName: nil, numViews: nil, numVotes: nil, numComments: nil, numHearts: nil, rank: nil, dateCreated: nil, hex: nil, description: nil, url: nil, imageUrl: nil, badgeUrl: nil, apiUrl: nil, colors: nil, template: nil)
    }
}
