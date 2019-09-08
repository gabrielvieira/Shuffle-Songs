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
        
        let worker = PlayListWorker()
        let presenter = PlayListPresenter()
        let interactor = PlayListInteractor(presenter: presenter, worker: worker)
        let controller = PlayListViewController(interactor: interactor)
        presenter.viewController = controller
        navigationController.pushViewController(controller, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        navigationController.navigationBar.barStyle = .blackOpaque
        navigationController.navigationBar.tintColor = ColorConstants.lightPurple
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = ColorConstants.lightPurple
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorConstants.white]
    }
}

