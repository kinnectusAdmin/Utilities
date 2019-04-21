//
//  Date_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
extension TimeInterval {
    /// Formatted date
    /// M/D
    /// - Returns: String
    public func shortDate() -> String {
        let components = Calendar.current.dateComponents([.month, .day], from: Date(timeIntervalSince1970: self))
        guard let month = components.month, let day = components.day else { return ""}
        return "\(month)/\(day)"
    }
}
