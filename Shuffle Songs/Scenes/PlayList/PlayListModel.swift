//
//  PlayListModel.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct LookupResponse: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType
    let artistType: String?
    let primaryGenreName: String
    let artistName: String
    let id: Int
    let releaseDate: Date?
    let artistID, trackTimeMillis: Int?
    let collectionName: String?
    let trackExplicitness: TrackExplicitness?
    let trackCensoredName: String?
    let collectionID: Int?
    let trackName: String?
    let country: String?
    let artworkURL: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, artistType, primaryGenreName, artistName, id, releaseDate
        case artistID = "artistId"
        case trackTimeMillis, collectionName, trackExplicitness, trackCensoredName
        case collectionID = "collectionId"
        case trackName, country
        case artworkURL = "artworkUrl"
    }
}

enum TrackExplicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum WrapperType: String, Codable {
    case artist = "artist"
    case track = "track"
}
