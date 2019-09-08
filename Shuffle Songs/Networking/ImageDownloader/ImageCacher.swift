//
//  ImageCacher.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

class ImageCacher {
    
    private let cache: NSCache<NSString, UIImage>
    static let shared = ImageCacher()
    
    private init() {
        cache = NSCache<NSString, UIImage>()
    }
    
    func loadImage(for key: NSString) -> UIImage? {
        return cache.object(forKey: key)
    }
    
    func cache(image: UIImage, withKey key: NSString) {
        cache.setObject(image, forKey: key)
    }
}
