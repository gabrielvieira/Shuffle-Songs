//
//  AppDelegate.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 03/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let coordinator = Coordinator(navigationController: navigationController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = coordinator.navigationController
        self.window!.makeKeyAndVisible()
        coordinator.start()
        return true
    }
}

