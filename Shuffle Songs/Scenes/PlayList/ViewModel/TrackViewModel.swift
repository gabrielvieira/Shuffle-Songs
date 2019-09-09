//
//  TrackViewModel.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

struct TrackViewModel {
 
    let name: String
    let artistName: String
    let artwork: URL
}

extension TrackViewModel: Equatable {
    public static func ==(lhs: TrackViewModel, rhs: TrackViewModel) -> Bool {
        return lhs.artistName == rhs.artistName &&
            lhs.artwork == rhs.artwork &&
            lhs.name == rhs.name
    }
}
