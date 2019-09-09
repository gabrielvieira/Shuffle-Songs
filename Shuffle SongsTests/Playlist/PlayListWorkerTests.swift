//
//  PlayListWorkerTests.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class PlayListWorkerTests: XCTestCase {
    
    var sut: PlayListWorker!
    
    func test_create_playlist_from_lookup_response() {
        
        let managerExpectation = expectation(description: #function)
        let expectedNumberOfArtists = 5
        let expectedNumberOfTracks = 25
        
        let expectedArtist = Artist(id: 1171421960, name: "Charlie and the Chewie Humans", type: "Artist", primaryGenreName: "Metal")
        let expectedTrack = Track(id: 579273552, artistId: 1171421960, name: "Heartbeat Fire", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fcharlie-and-the-chewy-humans-epithet.png?alt=media&token=6a1baa1d-dfe1-4cb4-8042-b11de7b26dce")!, primaryGenreName: "Metal")

        
        sut = PlayListWorker(apiClient: APIClientMock())
        var playlist: PlayList?
        
        sut.fetchPlayList { result in
            
            switch result {
            case .success(let response):
                playlist = response
            case .failure(_):
                 XCTFail("Result was not a success case.")
            }
            managerExpectation.fulfill()
        }
            
         waitForExpectations(timeout: 1.0) { (_) in
            
            XCTAssert(expectedNumberOfArtists == playlist?.artists.count)
            XCTAssert(expectedNumberOfTracks == playlist?.tracks.count)
            XCTAssert((playlist?.artists.contains(expectedArtist))!)
            XCTAssert((playlist?.tracks.contains(expectedTrack))!)
        }
    }
}
