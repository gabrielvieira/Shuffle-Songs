//
//  PlayListWorker.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright (c) 2019 Gabriel Tomaz. All rights reserved.

import UIKit

protocol PlayListWorkerProtocol {
    func fetchPlayList(completion: @escaping (APIResult<LookupResponse>) -> Void)
}

class PlayListWorker: PlayListWorkerProtocol {
    
    let apiClient: APIClientProtocol
    let ids = [909253, 1171421960, 358714030, 1419227, 264111789]
    let limit = 5
    
    public init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchPlayList(completion: @escaping (APIResult<LookupResponse>) -> Void) {
    
        let playListRequest = PlayListRequest(ids: self.ids, limit: self.limit)
        
        self.apiClient.request(playListRequest.getUrlRequest()) { (result: APIResult<LookupResponse>) in
            
            switch result {
                
            case let .success(lookupResponse):
                completion(.success(lookupResponse))
                return
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
