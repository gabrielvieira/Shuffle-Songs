//
//  UIImage+Extensions.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: URL) {
        
        let imageChace = ImageCacher.shared
        
        if let cachedImage = imageChace.loadImage(for: url.absoluteString as NSString) {
            self.image = cachedImage
        } else {
            self.image = UIImage(named: ImageConstants.placeholderIcon)
            let imageDownloader = ImageDownloader(imageCache: imageChace)
            
            imageDownloader.loadImage(from: url) { [weak self] (image) in
                guard let image = image else { return }
                self?.alpha = 0
                self?.image = image
                UIView.animate(withDuration: 0.2, animations: {
                    self?.alpha = 1
                })
            }
        }
    }
}
