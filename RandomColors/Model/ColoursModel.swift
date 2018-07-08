//
//  ColoursModel.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

struct ColoursModel {
    let id: Int?
    let title: String?
    let userName: String?
    let numViews: Int?
    let numVotes: Int?
    let numComments: Int?
    let numHearts: Int?
    let rank: Int?
    let dateCreated: String?
    
    let hex: String?
    let rgb: [String:Any]?
    let hsv: [String:Any]?
    
    let description: String?
    let url: String?
    let imageUrl: String?
    let badgeUrl: String?
    let apiUrl: String?
    //patterns
    let colors: [Any]?
    let template: [String:Any]?
    
    
    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        id = json["id"] as? Int ?? 0
        title = json["title"] as? String ?? ""
        userName = json["userName"] as? String ?? ""

        numViews = json["numViews"] as? Int ?? 0
        numVotes = json["numVotes"] as? Int ?? 0
        numComments = json["numComments"] as? Int ?? 0
        numHearts = json["numHearts"] as? Int ?? 0
        rank = json["rank"] as? Int ?? 0

        dateCreated = json["dateCreated"] as? String ?? ""
       
        //colours
        hex = json["hex"] as? String ?? ""
        rgb = json["rgb"] as? [String: Any] ?? [:]
        hsv = json["hsv"] as? [String: Any] ?? [:]

        description = json["description"] as? String ?? ""
        url = json["url"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
        badgeUrl = json["badgeUrl"] as? String ?? ""
        apiUrl = json["apiUrl"] as? String ?? ""
        
        //patterns
        colors = json["colors"] as? [Any] ?? []
        template = json["template"] as? [String: Any] ?? [:]

    }
    
}


extension ColoursModel : Parceable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<ColoursModel, ErrorResult> {
        if let _ = dictionary["id"]{
            guard let result = ColoursModel.init(json: dictionary)else{
                return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
            }
            return Result.success(result)

        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}
