//
//  CategoryURL.swift
//  Viper_SB
//  Entity (Model)
//  Created by Uri on 26/11/22.
//

import Foundation

struct CategoryURL: Codable {
    
    var _links: Links
    
    struct Links: Codable {
        var mySelf: [URLdetail]
        
        enum CodingKeys: String, CodingKey {
            case mySelf = "self"
        }
    }
    
    struct URLdetail: Codable {
        var href: String
    }
}
