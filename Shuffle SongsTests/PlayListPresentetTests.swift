//
//  PlayListPresentetTests.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class PlayListPresentetTests: XCTestCase {

    var sut: PlayListPresenter!
    var viewControllerSpy: PlayListViewControllerSpy!
    
    override func setUp() {
        
        sut = PlayListPresenter()
        viewControllerSpy = PlayListViewControllerSpy()
        sut.viewController = viewControllerSpy
    }
    
    func test_create_playlist_viewModel() {
        
        let playlsit = LookupMock().getPlaylist()
        let viewModel = sut.createViewModel(playlsit)
        
        let expectedTrackViewModel = TrackViewModel(name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans (Metal)", artwork: URL(string: "https://firebasestorage.googleapis.com")!)
        
        XCTAssert(viewModel.trackList[0] == expectedTrackViewModel)
    }
    
    func test_present_play_list_view_model() {
        
        let playlsit = LookupMock().getPlaylist()
        let trackCount = playlsit.tracks.count
        sut.presentPlaylist(playList: playlsit)
        
        XCTAssert(viewControllerSpy.displayedViewModel?.trackList.count == trackCount)
        XCTAssert(viewControllerSpy.displayPlayListCalled)
        
//            Track(id: 579273550, artistId: 1171421960, name: "Bomb Secrets", artistName: "Charlie and the Chewie Humans", wrapperType: "track", artwork: URL(string: "https://firebasestorage.googleapis.com")!, primaryGenreName: "Metal"),
    }
    
    func test_display_error_called_when_receive_error() {
        
        let error = APIClientError.badRequest
        sut.presentError(error: error)
        XCTAssert(viewControllerSpy.displayErrorCalled)
    }
}
