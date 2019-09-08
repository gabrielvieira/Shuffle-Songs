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
        
    }
    
    func presentError(error: Error) {
        
    }
}
