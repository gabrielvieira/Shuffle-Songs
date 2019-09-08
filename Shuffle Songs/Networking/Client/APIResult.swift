//
//  APIResult.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
