//
//  APIClientMock.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class APIClientMock: APIClientProtocol {
    
    var apiClientError: Error?
    
    func request<T>(_ request: URLRequest?, completion: @escaping (Result<T>) -> Void) where T : Decodable {
     
        if let error = self.apiClientError {
            completion(.failure(error))
            return
        }
        
        let jsonData = LookupMock().getLookUpData()
        
        guard let obj = try? JSONDecoder().decode(T.self, from: jsonData) else {
            completion(.failure(APIClientError.couldNotParseObject))
            return
        }
        completion(.success(obj))
    }
}
