//
//  ImageDownloader.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 04/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

protocol ImageDownloaderProtocol {
    func loadImage(from url: URL, completion: @escaping ((UIImage?) -> Void))
}

class ImageDownloader: ImageDownloaderProtocol {
    
    private let urlSession: URLSession
    private let imageCache: ImageCacher
    
    init(urlSession: URLSession = URLSession.shared, imageCache: ImageCacher = ImageCacher.shared) {
        self.urlSession = urlSession
        self.imageCache = imageCache
    }
    
    func loadImage(from url: URL, completion: @escaping ((UIImage?) -> Void)) {
        if let cachedImage = imageCache.loadImage(for: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
        } else {
            URLSession.shared.dataTask(with: url) { [imageCache] (data, _, _) in
                guard
                    let data = data,
                    let image = UIImage(data: data)
                    else { return }
                imageCache.cache(image: image, withKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
                }.resume()
        }
    }
}

