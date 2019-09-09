//
//  PlayListViewControllerMock.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class PlayListViewControllerSpy: PlayListDisplayProtocol {
    
    var displayedViewModel: PlayListViewModel?
    var displayPlayListCalled = false
    var displayErrorCalled = false
    
    func displayPlaylist(viewModel: PlayListViewModel) {
        self.displayedViewModel = viewModel
        displayPlayListCalled = true
    }
    
    func displayError(message: String) {
        self.displayErrorCalled = true
    }
}
