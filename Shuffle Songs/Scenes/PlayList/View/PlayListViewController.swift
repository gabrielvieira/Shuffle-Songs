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

class PlayListViewController: BaseViewController {

    var interactor: PlayListInteractorProtocol
    let tableView: UITableView
    private var viewModel: PlayListViewModel = PlayListViewModel(trackList: [])
    private let cellIdentifier = "PlayListTableViewCell"
    
    init(interactor: PlayListInteractorProtocol, tableView: UITableView = UITableView()) {
        self.interactor = interactor
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        interactor.fetchPlaylist()
        self.showLoader()
    }
    
    private func setupView() {
        
        self.setupConstraints()
        self.setupTableView()
        self.setupNavigationBar()
    }
    
    private func setupConstraints() {

        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let verticalConstraint = self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let widthConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let heightConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        self.view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupNavigationBar() {
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ImageConstants.shuffleIcon),
                                                 style: .done,
                                                 target: self,
                                                 action: #selector(PlayListViewController.shuffle))
        
        rightBarButtonItem.tintColor = ColorConstants.white
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.title = "shuffle_title".localized
    }
    
    private func setupTableView() {
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorConstants.purple
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: self.cellIdentifier, bundle: nil),
                                forCellReuseIdentifier: self.cellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundView = backgroundView
    }
    
    @objc func shuffle() {
        
        self.interactor.shufflePlaylist()
    }
}

extension PlayListViewController: PlayListDisplayProtocol {
    
    func displayPlaylist (viewModel: PlayListViewModel) {
        
        self.viewModel = viewModel
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.hideLoader()
        }
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: "alert".localized, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
}

extension PlayListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? PlayListTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = self.viewModel.trackList[indexPath.row]
        cell.setup(cellViewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.trackList.count
    }
}
