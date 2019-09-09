//
//  PlayListWorkerSky.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class PlayListWorkerSky: PlayListWorkerProtocol {
    
    var fetchPlayListCalled = false
    
    func fetchPlayList(completion: @escaping (Result<PlayList>) -> Void) {
        
        fetchPlayListCalled = true
        let playlist = LookupMock().getPlaylist()
        completion(.success(playlist))
    }
}
