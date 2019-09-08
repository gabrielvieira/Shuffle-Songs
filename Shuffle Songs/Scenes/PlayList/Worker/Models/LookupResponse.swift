//
//  LookupResponse.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

struct LookupResponse: Decodable {
    
    let resultCount: Int
    let result: [LookUp]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case result = "results"
    }
}
