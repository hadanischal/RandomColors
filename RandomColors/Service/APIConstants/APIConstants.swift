//
//  APIConstants.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

enum Method: String {
    case colors = "colors/"
    case patterns = "patterns/"
}

struct APIConstants {
    static let baseURLString = "http://www.colourlovers.com/api/"
    static let searchKey = "random?format=json"

    static var colorsURL: String {
        return generalURL(method: .colors)
    }

    static var patternsURL: String {
        return generalURL(method: .patterns)
    }

    // MARK: - General Methods
    private static func generalURL(method: Method) -> String {
        let finalURL = baseURLString + method.rawValue + searchKey
        return finalURL
    }
 }

// http://www.colourlovers.com/api/colors/random?format=json. use either RGB or Hex value
// http:// www.colourlovers.com/api/patterns/random?format=json. use imageUrl value
