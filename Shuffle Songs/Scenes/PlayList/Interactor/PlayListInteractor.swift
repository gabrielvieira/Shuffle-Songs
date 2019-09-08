//
//  PlayListInteractor.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright (c) 2019 Gabriel Tomaz. All rights reserved.

import UIKit

protocol PlayListInteractorProtocol {
    func fetchPlaylist()
    func shufflePlaylist()
}

class PlayListInteractor: PlayListInteractorProtocol {
    
    private var worker: PlayListWorkerProtocol
    private var presenter: PlayListPresenterProtocol
    private let trackShuffler: TrackShufflerProtocol
    private var playlist: PlayList?
    
    init(presenter: PlayListPresenterProtocol,
         worker: PlayListWorkerProtocol = PlayListWorker(),
         trackShuffler: TrackShufflerProtocol = TrackShuffler()) {
        
        self.presenter = presenter
        self.trackShuffler = trackShuffler
        self.worker = worker
    }
    
    func fetchPlaylist() {
        
        self.worker.fetchPlayList(completion: { result in
            
            switch result {
                
            case let .success(playlist):
                self.playlist = playlist
                self.presenter.presentPlaylist(playList: playlist)
                
            case let .failure(error):
                self.presenter.presentError(error: error)
            }
        })
    }
    
    func shufflePlaylist() {
        
        guard let currentPlayList = self.playlist else {
            return
        }
        
        let shuffledPlauList = PlayList(artists: currentPlayList.artists,
                                        tracks: self.trackShuffler.shufle(tracks: currentPlayList.tracks))
        
        self.presenter.presentPlaylist(playList: shuffledPlauList)
    }
}
