//
//  UIColor_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIColor {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - red: <#red description#>
    ///   - green: <#green description#>
    ///   - blue: <#blue description#>
    /// - Returns: <#return value description#>
    static public func createColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}
