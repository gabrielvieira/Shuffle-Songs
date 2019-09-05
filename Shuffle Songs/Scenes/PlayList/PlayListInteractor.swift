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
    
    var presenter: PlayListPresenterProtocol?
    var worker: PlayListWorker?
    
    func fetchPlaylist() {
        
    }
    
    func shufflePlaylist() {
    
    }
}
