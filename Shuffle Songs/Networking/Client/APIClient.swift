//
//  APIClient.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func request<T:Decodable>(_ request: APIRequestProtocol, completion: @escaping (APIResult<T>) -> Void)
}

class APIClient: APIClientProtocol {
    
    public func request<T:Decodable>(_ request: APIRequestProtocol, completion: @escaping (APIResult<T>) -> Void) {
        
        guard let urlRequest = self.buildURLRequest(request) else {
            completion(.failure(.buildRequestError))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
            }
            
            guard let data = data else {
                completion(.failure(.brokenData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown("Could not cast to HTTPURLResponse object.")))
                return
            }
            
            switch httpResponse.statusCode {
                
            case 200...299:
                
                guard let obj = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(.couldNotParseObject))
                    return
                }
                
                completion(.success(obj))
                
            case 403:
                completion(.failure(.authenticationRequired))
                
            case 404:
                completion(.failure(.couldNotFindHost))
                
            case 500:
                completion(.failure(.badRequest))
                
            default: break
            }
            
            }.resume()
    }
    
    private func buildURLRequest(_ request: APIRequestProtocol) -> URLRequest? {
        
        guard let url = URL(string: "\(APIConstants.BaseUrl)\(request.endpoint)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        if request.method == .post {
            
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        for (key, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
