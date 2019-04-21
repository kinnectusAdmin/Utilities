//
//  Array_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
extension Array where Element: Equatable {
    /// <#Description#>
    ///
    /// - Parameter element: <#element description#>
    /// - Returns: <#return value description#>
    public func removing( element: Element) -> Array {
        let tempArray = self.filter { $0 != element}
        return tempArray
    }
}
extension Array {
    /// <#Description#>
    ///
    /// - Parameter index: <#index description#>
    /// - Returns: <#return value description#>
    public func itemAt(_ index: Int) -> Element? {
        if count > index {
            return self[index]
        } else {
            return nil
        }
    }
    /// <#Description#>
    ///
    /// - Parameter elements: <#elements description#>
    /// - Returns: <#return value description#>
    public func appendingAll(_ elements: [Element]) -> Array {
        var tempArray = self
        for element in elements {
            tempArray = tempArray.appending(element)
        }
        return tempArray
    }
    /// <#Description#>
    ///
    /// - Parameter element: <#element description#>
    /// - Returns: <#return value description#>
    public func appending(_ element: Element) -> Array {
        var tempArray = self
        tempArray.append(element)
        return tempArray
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func notEmpty() -> Bool {
        return !isEmpty
    }
    /// <#Description#>
    ///
    /// - Parameter limit: <#limit description#>
    /// - Returns: <#return value description#>
    public func groupBy(limit: Int)->[[Element]]{
        var sorted = self
        var groupedOptions = [[Element]]()
        for _ in 0...count{
            let first = sorted.prefix(limit)
            if !first.isEmpty{
                groupedOptions.append(first.map({$0}))
            }
            sorted = sorted.dropFirst(limit).map({$0})
        }
        return groupedOptions
    }
}
extension Array where Element == String {
    /// <#Description#>
    ///
    /// - Parameter separator: <#separator description#>
    /// - Returns: <#return value description#>
    public func stringify(with separator: String)->String{
        let items = self.reduce(separator) { (collection , item ) -> String in
            
            return String(collection) + String(describing: item)+separator
            }.dropFirst()
        return String(items)
    }
    
    mutating public func removeWord(item: String) {
        for word in self.enumerated() {
            if word.element == item {
                remove(at: word.offset)
            }
        }
    }
}
