//
//  PlayListInteractor.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright (c) 2019 Gabriel Tomaz. All rights reserved.

import UIKit

protocol PlayListInteractorProtocol {

}

class PlayListInteractor: PlayListInteractorProtocol {
    
    var presenter: PlayListPresenterProtocol?
    var worker: PlayListWorker?
    
//    func doSomething(request: PlayList.Something.Request) {
//
//        worker = PlayListWorker()
//        worker?.doSomeWork()
//
//        let response = PlayList.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
