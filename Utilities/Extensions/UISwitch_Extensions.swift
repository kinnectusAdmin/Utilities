//
//  UISwitch_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UISwitch {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - onColor: <#onColor description#>
    ///   - tint: <#tint description#>
    ///   - background: <#background description#>
    ///   - cornerRadius: <#cornerRadius description#>
    /// - Returns: <#return value description#>
    static public func customSwitch(onColor: UIColor = UIColor.white, tint: UIColor = UIColor.white, background: UIColor = UIColor.white,cornerRadius: CGFloat = 0.0) -> UISwitch {
        let swtch = UISwitch()
        swtch.onTintColor = onColor
        swtch.tintColor = tint
        swtch.backgroundColor = background
        swtch.layer.cornerRadius = cornerRadius
        swtch.layer.masksToBounds = true
        swtch.translatesAutoresizingMaskIntoConstraints = false
        return swtch
    }
}
