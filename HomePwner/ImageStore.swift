//
//  ImageStore.swift
//  Homepwner
//
//  Created by Alex Flores on 12/17/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ImageStore: NSObject {
    
    var imageDictionary = [String:UIImage]()
    
    func setImage(image: UIImage, forKey key: String) {
        imageDictionary[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        return imageDictionary[key]
    }
    
    func deleteImageForKey(key: String) {
        imageDictionary.removeValueForKey(key)
    }
   
}
