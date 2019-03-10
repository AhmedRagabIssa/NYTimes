//
//  UIView+Extension.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import UIKit

extension UIView {
    
    func rounded(_ radius: CGFloat = 5) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func circular() {
        layer.cornerRadius = layer.bounds.height
        layer.masksToBounds = true
    }
}
