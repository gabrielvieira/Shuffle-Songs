//
//  Artist.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

struct Artist: Decodable {
    
    let id: Int
    let name: String
    let type: String
    let primaryGenreName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "artistName"
        case type = "artistType"
        case primaryGenreName
    }
}
