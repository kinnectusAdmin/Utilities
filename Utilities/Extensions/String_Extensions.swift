//
//  String_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
extension String {
    public func notEmpty() -> Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
extension String {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - width: <#width description#>
    ///   - textSize: <#textSize description#>
    /// - Returns: <#return value description#>
    public func rectForText(width: CGFloat, textSize: CGFloat)->CGRect{
        let size = CGSize(width: width, height: 1000)
        
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimateRect = NSString(string: self).boundingRect(with: size, options: options, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font):UIFont.systemFont(ofSize: textSize)]), context: nil)
        return estimateRect
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - strings: <#strings description#>
    ///   - words: <#words description#>
    /// - Returns: <#return value description#>
    public func replace(strings:[String], with words: [String])->String{
        var newWord = self
        for (index,string) in strings.enumerated() {
            newWord = newWord.replacingOccurrences(of: string , with: words[index])
        }
        return newWord
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func array()->[String]{
        return self.split(separator: ",").compactMap({String($0)})
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func possessiveForm() -> String {
        if let lastLetter = self.array().last {
            if lastLetter.caseInsensitiveCompare("s") == .orderedSame {
                return self+"'"
            } else {
                return self+"'s"
            }
        }
        return self
    }
}
// Helper public function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
// Helper public function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}
