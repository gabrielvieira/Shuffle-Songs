//
//  PlayListViewControllerTests.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class PlayListViewControllerTests: XCTestCase {
    
    var sut: PlayListViewController!
    var interactorSpy: PlayListInteractorSpy!
    var tableViewSpy: TableViewSpy!
    
    override func setUp() {
        interactorSpy = PlayListInteractorSpy()
        tableViewSpy = TableViewSpy()
        sut = PlayListViewController(interactor: interactorSpy, tableView: tableViewSpy)
    }
    
    func test_shoud_fetch_playlist_when_view_did_load() {
        sut.viewDidLoad()
        XCTAssert(interactorSpy.fetchPlayListCalled)
    }
    
    func test_number_of_sections_in_table_view_should_be_one() {
        let numberOfSections = tableViewSpy.numberOfSections
        // Then
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_number_of_rows_shoud_be_equal_to_view_model() {

        let expectedNumberOfRows = 1
        let viewModel = PlayListViewModel(trackList: [TrackViewModel(name: "trackname", artistName: "name", artwork: URL(string: "https://firebase.com")!)])
        sut.displayPlaylist(viewModel: viewModel)
 
        DispatchQueue.main.async() {
            XCTAssert(expectedNumberOfRows == viewModel.trackList.count)
        }
    }
    
    func test_should_call_reload_data_after_fetch_playlist() {
        
        let viewModel = PlayListViewModel(trackList: [TrackViewModel(name: "trackname", artistName: "name", artwork: URL(string: "https://firebase.com")!)])
        sut.displayPlaylist(viewModel: viewModel)
        DispatchQueue.main.async() {
            XCTAssert(self.tableViewSpy.reloadDataCalled)
        }
    }
}
