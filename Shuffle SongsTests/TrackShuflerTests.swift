//
//  TrackShuflerTests.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class TrackShuflerTests: XCTestCase {

    let lookupMock = LookupMock()
    let shuffler = TrackShuffler()
    let worker = PlayListWorker()
    
    func test_shuffle_when_receive_empty_list() {
        let shuffledList = shuffler.shufle(tracks: [])
        XCTAssert(shuffledList.count == 0)
    }

    func test_shuffle_not_return_empty_result() {
        
        let mockResponse = lookupMock.getSuccess()
        let playList = worker.createPlayList(result: mockResponse.result)
        let shuffledList = shuffler.shufle(tracks: playList.tracks)
        
        XCTAssert(shuffledList.count > 0)
    }
    
    func test_shuffle_return_balanced_result() {
        
        let mockResponse = lookupMock.getSuccess()
        let playList = worker.createPlayList(result: mockResponse.result)
        let shuffledList = shuffler.shufle(tracks: playList.tracks)
        
        for i in 0 ..< shuffledList.count - 1 {
            let track = shuffledList[i]
            let next_track = shuffledList[i + 1]
            XCTAssert(track.artistId != next_track.artistId)
        }
    }
}
