//
//  Router.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

//class Router {
//
//    static func routeToPlayList() {
//
//    }
//}

protocol CoordinatorProtocol {
    func start()
    var navigationController: UINavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    
    func start() {
//        let presenter = PlaylistPresenter()
//        let manager = PlaylistProvider()
//        let interactor = PlaylistInteractor(presenter: presenter, manager: manager)
//        let playlistViewContoller = PlaylistViewController(interactor: interactor)
        
        let controller = PlayListViewController()
        let interactor = PlayListInteractor()
        let presenter = PlayListPresenter()
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = controller
//        presenter.viewController = playlistViewContoller
        navigationController.pushViewController(controller, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.barStyle = .blackOpaque
        navigationController.navigationBar.tintColor = ColorConstants.lightPurple
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorConstants.white]
    }
}

