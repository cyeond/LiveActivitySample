//
//  Extensions.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/19.
//

import UIKit

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let size = CGSize(width: newWidth, height: newWidth)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
