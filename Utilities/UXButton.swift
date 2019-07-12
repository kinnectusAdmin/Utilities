//
//  Button.swift
//  Journey
//
//  Created by blakerogers on 9/15/18.
//  Copyright © 2018 Blake Rogers. All rights reserved.
//

import UIKit
public protocol AdvancedTitle {
    var uxTitleFont: UIFont { get set }
    var uxTitle: String { get set }
    var uxTitleColor: UIColor { get set}
}
open class UXButton: UIButton, AdvancedTitle {
    public typealias Action = () -> Void
    public var uxTitleFont: UIFont = UIFont.systemFont(ofSize: 18)
    public var uxTitle: String = ""
    public var uxTitleColor: UIColor = .gray
    open override func layoutSubviews() {
        super.layoutSubviews()
        setActionTarget()
    }
    private var action: Action? {
        didSet {
            print( action == nil)
        }
    }
    @objc private func initiateAction(_ sender: UXButton) {
        action?()
    }
    private func setActionTarget() {
        self.addTarget(self, action: #selector(UXButton.initiateAction(_:)), for: .touchUpInside)
    }
    public func setAction(_ uxAction: Action?) {
        self.action = uxAction
    }
    deinit {
        print("hello")
    }
}
extension UXButton{
    public static func button(font: UIFont = UIFont.systemFont(ofSize: 18), color: UIColor = UIColor.black, background: UIColor = UIColor.clear, image: UIImage? = nil, title: String = "", alpha: CGFloat = 1.0, radius: CGFloat = 0.0, borderColor: UIColor = .clear, borderWidth: CGFloat = 1.0) -> UXButton {
        let button = UXButton()
        button.uxTitleFont = font
        button.uxTitle = title
        button.uxTitleColor = color
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.backgroundColor = background
        let atts: [String: Any] = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): font as Any,
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color as Any
        ]
        let attTitle = NSAttributedString(string: title, attributes: convertToOptionalNSAttributedStringKeyDictionary(atts))
        button.setAttributedTitle(attTitle, for: .normal)
        button.setImage(image, for: .normal)
        button.alpha = alpha
        button.layer.cornerRadius = radius
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    public static func image(tint: UIColor, image: UIImage) -> UXButton {
        let button = UXButton()
        button.tintColor = tint
        button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
extension UXButton {
    public func updateAttributedTitle(title: String) {
        let newTitle = NSAttributedString(string: title, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): uxTitleFont, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): uxTitleColor]))
        uxTitle = title
        setAttributedTitle(newTitle, for: .normal)
    }
}
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

