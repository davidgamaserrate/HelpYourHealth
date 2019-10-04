//
//  UIViewExtension.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

extension UIView {
    
    func shadow(color: UIColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float, cornerRadius: CGFloat) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.cornerRadius = cornerRadius
    }
    
    func circleCorner() {
        
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
