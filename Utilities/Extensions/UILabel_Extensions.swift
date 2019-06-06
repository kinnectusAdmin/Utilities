//
//  UILabel_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UILabel{
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - font: <#font description#>
    ///   - txtColor: <#txtColor description#>
    ///   - background: <#background description#>
    ///   - alpha: <#alpha description#>
    ///   - text: <#text description#>
    ///   - alignment: <#alignment description#>
    ///   - adjustsFont: <#adjustsFont description#>
    ///   - numberOfLines: <#numberOfLines description#>
    /// - Returns: <#return value description#>
    static public func labelWith(text: String = "", font: UIFont, txtColor: UIColor, background: UIColor = UIColor.white ,alpha: CGFloat = 1.0, alignment: NSTextAlignment = .left, adjustsFont: Bool = false, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = txtColor
        label.backgroundColor = background
        label.alpha = alpha
        label.text = text
        label.textAlignment = alignment
        label.adjustsFontSizeToFitWidth = adjustsFont
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
