//
//  PlayListPresenterSpy.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class PlayListPresenterSpy: PlayListPresenterProtocol {
    
    var presentPlayListCalled = false
    var presentErrorCalled = false
    
    func presentPlaylist(playList: PlayList) {
        
    }
    
    func presentError(error: Error) {
        
    }
}
