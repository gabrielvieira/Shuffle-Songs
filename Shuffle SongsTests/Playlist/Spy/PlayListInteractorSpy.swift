//
//  PlayListInteractorMock.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class PlayListInteractorSpy: PlayListInteractorProtocol {
    
    var fetchPlayListCalled = false
    var shufflePlaylistCalled = false
    
    func fetchPlaylist() {
        fetchPlayListCalled = true
    }
    
    func shufflePlaylist() {
        shufflePlaylistCalled = true
    }
}
