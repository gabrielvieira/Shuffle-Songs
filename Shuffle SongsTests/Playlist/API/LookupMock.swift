//
//  LookupMock.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class LookupMock {
    
    func getLookUpData() -> Data {
        
        let bundle = Bundle(for: LookupMock.self)
        
        guard
            let filePath = bundle.path(forResource: "LookupMock", ofType: "json")
            else { fatalError("Json Not Found") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            
            return jsonData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getLookUpResponse() -> LookupResponse {
        
        return try! JSONDecoder().decode(LookupResponse.self, from: self.getLookUpData())
    }
    
    func getPlaylist() -> PlayList {
        
        let artists = [
            Artist(id: 1171421960, name: "Charlie and the Chewie Humans", type: "Artist", primaryGenreName: "Metal"),
            Artist(id: 1419227, name: "MC Arianne", type: "Artist", primaryGenreName: "Pop"),
            Artist(id: 909253, name: "John Dollar", type: "Artist", primaryGenreName: "Rock"),
            Artist(id: 358714030, name: "Bloco TótiOQue", type: "Artist", primaryGenreName: "Axé"),
            Artist(id: 264111789, name: "Decimais MC's", type: "Artist", primaryGenreName: "Hip-Hop")
        ]
        
        let tracks = [
            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
        ]
        
        return PlayList(artists: artists, tracks: tracks)
    }
}
