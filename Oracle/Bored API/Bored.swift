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

    enum CodingKeys: String, CodingKey {
        //case symbol
        case profile
        case failure
    }
    
    //var symbol: String?
    var profile: Profile?
    
    init() {
        //symbol = "???"
        profile = nil
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //symbol = try container.decode(String.self, forKey: .symbol)
        profile = try container.decode(Profile.self, forKey: .profile)
    }
}
