//
//  UIView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIView {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - dx: <#dx description#>
    ///   - dy: <#dy description#>
    ///   - color: <#color description#>
    ///   - radius: <#radius description#>
    ///   - opacity: <#opacity description#>
    public func addingShadow(_ dx:CGFloat,dy:CGFloat,color: UIColor,radius: CGFloat,opacity:Float) -> UIView {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: dx, height: dy)
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        return self
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - frame: <#frame description#>
    ///   - start: <#start description#>
    ///   - end: <#end description#>
    ///   - locations: <#locations description#>
    ///   - colors: <#colors description#>
    public func addingGradientScreen(frame: CGRect, start: CGPoint, end: CGPoint, locations: [NSNumber], colors: [CGColor]) -> UIView {
        let gradient = CAGradientLayer()
        gradient.bounds = self.frame
        gradient.frame = frame
        gradient.startPoint = start
        gradient.endPoint = end
        gradient.locations = locations
        gradient.colors = colors
        self.layer.insertSublayer(gradient, at: 0)
        return self
    }
    public func withAlpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - frame: <#frame description#>
    ///   - start: <#start description#>
    ///   - end: <#end description#>
    ///   - locations: <#locations description#>
    ///   - colors: <#colors description#>
    /// - Returns: <#return value description#>
    public func addGradientScreen_Return(frame: CGRect, start: CGPoint, end: CGPoint, locations: [NSNumber], colors: [CGColor])-> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.bounds = self.frame
        gradient.frame = frame
        gradient.startPoint = start
        gradient.endPoint = end
        gradient.locations = locations
        gradient.colors = colors
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    public static func form<View: UIView>() -> View {
        let instance = View()
        instance.translatesAutoresizingMaskIntoConstraints = false
        return instance
    }
}
