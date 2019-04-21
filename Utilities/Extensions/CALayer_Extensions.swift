//
//  CALayer_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension CALayer {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - dx: <#dx description#>
    ///   - dy: <#dy description#>
    ///   - color: <#color description#>
    ///   - radius: <#radius description#>
    ///   - opacity: <#opacity description#>
    public func addShadow(_ dx:CGFloat,dy:CGFloat,color: UIColor,radius: CGFloat,opacity:Float) {
        shadowColor = color.cgColor
        shadowOffset = CGSize(width: dx, height: dy)
        shadowRadius = radius
        shadowOpacity = opacity
    }
}
