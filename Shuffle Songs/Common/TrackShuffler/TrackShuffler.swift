//
//  Shuffler.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import Foundation

protocol TrackShufflerProtocol {
    func shufle(tracks: [Track]) -> [Track]
}

class TrackShuffler: TrackShufflerProtocol {
    
    func shufle(tracks: [Track]) -> [Track] {
        
        //shuffle track
        var dic =  [Int : [Track]]()
        let shuffledList = tracks.shuffled()
        var result: [Track] = []
        
        //separate by artist ID
        for track in shuffledList {
            if dic[track.artistId] != nil {
                dic[track.artistId]?.append(track)
            } else {
                dic[track.artistId] = [track]
            }
        }
        
        //get max lenght for all track list on dic
        var maxLenght = 0
        let keys = dic.keys.shuffled()
        
        for key in keys {
            if let val = dic[key], val.count > maxLenght {
                maxLenght = val.count
            }
        }
        
        //generate result list
        for i in 0 ..< maxLenght {
            for key in keys {
                if let tracks = dic[key], tracks.count < i {
                    result.append(tracks[i])
                }
            }
        }
        
        return result
    }
}
