//
//  Router.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

class Router {
    
    static func routeToPlayList() {
        
        let controller = PlayListViewController()
        let interactor = PlayListInteractor()
        let presenter = PlayListPresenter()
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = controller
    }
}
