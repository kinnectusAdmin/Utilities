//
//  UIImage_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIImage{
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - size: <#size description#>
    /// - Returns: <#return value description#>
    class public func scaleImageToSize(image: UIImage,size:CGSize)->UIImage{
        UIGraphicsBeginImageContext(size)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        image.draw(in: rect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
}
