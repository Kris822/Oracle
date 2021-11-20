//
//  Bored.swift
//  Oracle
//
//  Created by Lee, Christopher on 11/20/21.
//

import Foundation

struct Profile: Decodable {
    var activity: String
    var type: String
    var participants: Int
    var price: Double
    var link: String
    var key: Double
    var accessibility: Double
}

class Bored: Decodable {

    enum CodingKeys: CodingKey {
        //case symbol
        case activity

    }
    
    //var symbol: String?
    var activity: String?
    
    init() {
        //symbol = "???"
        activity = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //symbol = try container.decode(String.self, forKey: .symbol)
        activity = try container.decode(String.self, forKey: .activity)
    }
}
