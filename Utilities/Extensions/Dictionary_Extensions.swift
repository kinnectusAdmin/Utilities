//
//  Dictionary_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 6/17/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
extension Dictionary {
    public func updating(value: Value, for key: Key) -> Dictionary {
        var copy = self
        copy[key] = value
        return copy
    }
}
