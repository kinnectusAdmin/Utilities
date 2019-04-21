//
//  Optional_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
extension Optional {
    /// <#Description#>
    ///
    /// - Parameter nonOptional: <#nonOptional description#>
    /// - Returns: <#return value description#>
    public func otherwise(_ nonOptional: Wrapped) -> Wrapped {
        switch self {
        case .none:
            return nonOptional
        case .some(let wrapped):
            return wrapped
        }
    }
}
