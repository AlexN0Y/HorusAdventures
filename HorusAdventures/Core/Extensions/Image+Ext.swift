//
//  Image+Ext.swift
//  HorusAdventures
//
//  Created by Alex Gav on 24.09.2024.
//

import SwiftUI

extension Image {
    
    public init(name: String) {
        if let uiImage = UIImage(systemName: name) {
            self = Image(uiImage: uiImage)
        } else {
            self = Image(name)
        }
    }
}
