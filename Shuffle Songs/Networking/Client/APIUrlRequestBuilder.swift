//
//  APIUrlRequestBuilder.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 05/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

class APIUrlRequestBuilder {
    
    public func buildURLRequest(_ request: APIRequestProtocol) -> URLRequest? {
        
        switch request.method {
        case .get:
            return self.buildGetRequest(request)
        case .post:
            return self.buildPostRequest(request)
        default:
            return nil
        }
    }
    
    private func buildGetRequest(_ request: APIRequestProtocol) -> URLRequest? {
        
        guard let urlComponents = NSURLComponents(string: "\(APIConstants.BaseUrl)\(request.endpoint)") else {
            return nil
        }
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in request.parameters {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { return nil }
        
        return URLRequest(url: url)
    }
    
    private func buildPostRequest(_ request: APIRequestProtocol) -> URLRequest? {
        
        guard let url = URL(string: "\(APIConstants.BaseUrl)\(request.endpoint)") else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        for (key, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}

