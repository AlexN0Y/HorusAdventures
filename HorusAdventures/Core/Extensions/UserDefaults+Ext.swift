//
//  UserDefaults+Ext.swift
//  HorusAdventures
//
//  Created by Alex Gav on 24.09.2024.
//

import UIKit

extension UserDefaults {
    
    func saveImages(_ images: [UIImage], forKey key: String) {
        let imageDataArray = images.compactMap { $0.jpegData(compressionQuality: 0.3) }
        UserDefaults.standard.set(imageDataArray, forKey: key)
    }
    
    func retrieveImages(forKey key: String) -> [UIImage] {
        guard let imageDataArray = UserDefaults.standard.array(forKey: key) as? [Data] else {
            return []
        }
        let images = imageDataArray.compactMap { UIImage(data: $0) }
        return images
    }
}

