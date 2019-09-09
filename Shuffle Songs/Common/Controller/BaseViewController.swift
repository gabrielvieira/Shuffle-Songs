//
//  BaseViewController.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loaderView: UIView = UIView()
    private let loader: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    var isLoading = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loader.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.loaderView.backgroundColor = .clear
        self.loaderView.addSubview(self.loader)
    }
    
    func showLoader() {
        
        self.isLoading = true
        self.loaderView.frame = UIScreen.main.bounds
        self.loader.center = self.loaderView.center
        
        DispatchQueue.main.async {
            self.loader.startAnimating()
            self.view.addSubview(self.loaderView)
        }
    }
   
    func hideLoader() {

        self.isLoading = false
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.loaderView.removeFromSuperview()
        }
    }
}
