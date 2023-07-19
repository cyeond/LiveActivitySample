//
//  ImageManager.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/20.
//

import UIKit
import SwiftUI

class ImageManager {
    static let shared = ImageManager()
    
    private init() { }
    
    func saveImage(uiImage: UIImage) {
        guard let data = uiImage.jpegData(compressionQuality: 1.0) else { return }
        UserDefaults(suiteName: "group.com.cyeond")?.set(data, forKey: "image")
    }
    
    func loadImage() -> Image {
        var image = Image(systemName: "applewatch.watchface")
        if let data = UserDefaults(suiteName: "group.com.cyeond")?.data(forKey: "image"), let newImage = UIImage(data: data) {
            image = Image(uiImage: newImage)
        }
        return image
    }
}
