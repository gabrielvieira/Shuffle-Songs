//
//  LookupMock.swift
//  Shuffle SongsTests
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation
@testable import Shuffle_Songs

class LookupMock {
    
    func getSuccess() -> LookupResponse {
        
        let bundle = Bundle(for: LookupMock.self)
        
        guard
            let filePath = bundle.path(forResource: "LookupMock", ofType: "json")
            else { fatalError("Json Not Found") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            
            let obj = try JSONDecoder().decode(LookupResponse.self, from: jsonData)
            return obj
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
