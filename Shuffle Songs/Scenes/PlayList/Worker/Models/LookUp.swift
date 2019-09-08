//
//  LookUp.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

enum LookUp: Decodable {
    
    static let artistType = "artist"
    static let trackType = "track"
    
    case artist(Artist)
    case track(Track)
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        switch try container.decode(String.self, forKey: .wrapperType) {
            
            case LookUp.artistType: self = .artist( try Artist(from: decoder))
            case LookUp.trackType: self = .track(try Track(from: decoder))
            default: fatalError("Unknown type")
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case wrapperType
    }
}
