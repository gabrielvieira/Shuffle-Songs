//
//  Track.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

struct Track: Decodable {
    
    let id: Int
    let artistId: Int
    let name: String
    let artistName: String
    let wrapperType: String
    let artwork: URL
    let primaryGenreName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case artistId
        case wrapperType
        case artistName
        case name = "trackName"
        case artwork = "artworkUrl"
        case primaryGenreName
    }
}

extension Track: Equatable {
    public static func ==(lhs: Track, rhs: Track) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.artistName == rhs.artistName &&
            lhs.primaryGenreName == rhs.primaryGenreName
    }
}
