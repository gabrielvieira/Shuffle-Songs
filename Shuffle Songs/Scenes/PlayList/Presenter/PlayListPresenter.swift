//
//  PlayListPresenter.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright (c) 2019 Gabriel Tomaz. All rights reserved.

import UIKit

protocol PlayListPresenterProtocol {
    func presentPlaylist(playList: PlayList)
    func presentError(error: Error)
}

class PlayListPresenter: PlayListPresenterProtocol {
    
    weak var viewController: PlayListDisplayProtocol?
    
    func presentPlaylist(playList: PlayList) {
        let viewModel = self.createViewModel(playList)
        self.viewController?.displayPlaylist(viewModel: viewModel)
    }
    
    func createViewModel(_ playList: PlayList) -> PlayListViewModel {
        
        return PlayListViewModel(trackList:
            playList.tracks.compactMap {
                return TrackViewModel(name: $0.name,
                                      artistName: "\($0.artistName) (\($0.primaryGenreName))",
                    artwork: $0.artwork)
            }
        )
    }
    
    func presentError(error: Error) {
        self.viewController?.displayError(message: error.localizedDescription)
    }
}
