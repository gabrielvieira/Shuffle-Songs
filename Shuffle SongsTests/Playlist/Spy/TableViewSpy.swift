//
//  TableViewSpy.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

class TableViewSpy: UITableView {
    
    var reloadDataCalled = false
    
    override func reloadData() {
        
        reloadDataCalled = true
    }
}
