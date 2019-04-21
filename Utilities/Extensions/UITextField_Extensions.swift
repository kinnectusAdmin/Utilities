//
//  UITextField_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UITextField {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - text: <#text description#>
    ///   - textColor: <#textColor description#>
    ///   - background: <#background description#>
    ///   - font: <#font description#>
    ///   - placeholder: <#placeholder description#>
    ///   - alignment: <#alignment description#>
    ///   - isSecure: <#isSecure description#>
    ///   - visible: <#visible description#>
    convenience init(text: String = "",
                     textColor: UIColor = UIColor.black,
                     background: UIColor = UIColor.white,
                     font: UIFont = UIFont.systemFont(ofSize: 18),
                     placeholder: String = "",
                     alignment: NSTextAlignment = .left,
                     isSecure: Bool = false,
                     visible: Bool = true) {
        self.init()
        self.textColor = textColor
        self.backgroundColor = background
        self.font = font
        self.alpha = visible ? 1.0 : 0.0
        self.placeholder = placeholder
        self.textAlignment = alignment
        self.isSecureTextEntry = isSecure
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
