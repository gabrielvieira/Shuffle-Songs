//
//  APIRequestProtocol.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {

    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: [String : Any] { get }
    var headers: [String : String] { get }
    func getUrlRequest() -> URLRequest?
}

//default values for headers and body is empty
extension APIRequestProtocol {
    
    var headers: [String : String] {
        return [:]
    }
    
    var parameters: [String : Any] {
        return [:]
    }
}
