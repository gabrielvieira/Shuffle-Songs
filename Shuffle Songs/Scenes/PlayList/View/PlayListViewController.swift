//
//  PlayListViewController.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright (c) 2019 Gabriel Tomaz. All rights reserved.

import UIKit

protocol PlayListDisplayProtocol: class {
    func displayPlaylist (viewModel: PlayListViewModel)
    func displayError(message: String)
}

class PlayListViewController: BaseViewController, PlayListDisplayProtocol {

    var interactor: PlayListInteractorProtocol?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayPlaylist (viewModel: PlayListViewModel) {
        
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
}
