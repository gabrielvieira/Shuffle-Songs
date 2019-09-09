//
//  PlayListInteractorTests.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class PlayListInteractorTests: XCTestCase {
    
    var sut: PlayListInteractor!
    var presenterSpy: PlayListPresenterSpy!
    var worlerSpy: PlayListWorkerSky!
    
    override func setUp() {
        worlerSpy = PlayListWorkerSky()
        presenterSpy = PlayListPresenterSpy()
        sut = PlayListInteractor(presenter: presenterSpy, worker: worlerSpy)
    }
    
    func test_worker_fetch_play_list_called_and_presented() {
        
        sut.fetchPlaylist()
        XCTAssert(worlerSpy.fetchPlayListCalled)
        XCTAssert(presenterSpy.presentPlayListCalled)
    }
}
