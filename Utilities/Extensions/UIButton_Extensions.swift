//
//  UIButton_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIButton {
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - color: <#color description#>
    ///   - target: <#target description#>
    ///   - selector: <#selector description#>
    convenience init(title: String, color: UIColor, target: AnyObject?,selector: Selector) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.addTarget(target, action: selector, for: .touchUpInside)
        
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - font: <#font description#>
    ///   - color: <#color description#>
    ///   - background: <#background description#>
    ///   - image: <#image description#>
    ///   - title: <#title description#>
    ///   - alpha: <#alpha description#>
    ///   - radius: <#radius description#>
    convenience init(font: UIFont = UIFont.systemFont(ofSize: 18), color: UIColor = UIColor.black, background: UIColor = UIColor.clear, image: UIImage? = nil,title: String = "", alpha: CGFloat = 1.0, radius: CGFloat = 0.0) {
        self.init()
        backgroundColor = background
        let atts: [String: Any] = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): font as Any,
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color as Any
        ]
        let attTitle = NSAttributedString(string: title, attributes: convertToOptionalNSAttributedStringKeyDictionary(atts))
        setAttributedTitle(attTitle, for: .normal)
        setImage(image, for: .normal)
        self.alpha = alpha
        layer.cornerRadius = radius
        adjustsImageWhenHighlighted = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - normalStateImage: <#normalStateImage description#>
    ///   - selectedStateImage: <#selectedStateImage description#>
    ///   - tintColor: <#tintColor description#>
    ///   - background: <#background description#>
    /// - Returns: <#return value description#>
    static public func buttonWithStates(normalStateImage: UIImage, selectedStateImage: UIImage, tintColor: UIColor, background: UIColor = UIColor.clear) -> UIButton {
        let button = UIButton()
        button.backgroundColor = background
        button.tintColor = tintColor
        button.setImage(normalStateImage.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(selectedStateImage.withRenderingMode(.alwaysTemplate), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
