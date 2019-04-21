//
//  UITextView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UITextView {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - textColor: <#textColor description#>
    ///   - background: <#background description#>
    ///   - font: <#font description#>
    ///   - alignment: <#alignment description#>
    convenience init(textColor: UIColor = UIColor.black,
                     background: UIColor = UIColor.white,
                     font: UIFont = UIFont.systemFont(ofSize: 18),
                     alignment: NSTextAlignment = .left) {
        self.init()
        self.textColor = textColor
        self.backgroundColor = background
        self.font = font
        self.textAlignment = alignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
