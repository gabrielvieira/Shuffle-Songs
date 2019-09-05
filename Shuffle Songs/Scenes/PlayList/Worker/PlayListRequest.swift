//
//  PlayListRequest.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 05/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

struct PlayListRequest: APIRequestProtocol {
    
    let ids: [Int]
    let limit: Int
    
    public init(ids: [Int], limit: Int) {
        self.ids = ids
        self.limit = limit
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "/lookup"
    }
    
    var parameters: [String : Any] {
        
        let concatId = self.ids.compactMap { "\($0)" }.joined(separator: ",")
        return [
            "id": concatId,
            "limit": self.limit
        ]
    }
    
    func getUrlRequest() -> URLRequest? {
        let builder = APIUrlRequestBuilder()
        return builder.buildURLRequest(self)
    }
}
