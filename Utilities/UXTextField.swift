//
//  CustomTextField.swift
//  Journey
//
//  Created by Blake Rogers on 5/6/18.
//  Copyright © 2018 Blake Rogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent

public class UXTextField: UITextField {
    private var manager: TextManager?
    public var textValue: Box<(String)> = Box("")
    public var finalTextValue: Box<String> = Box("")
    var dismissOnEnter: Bool = false
    public func dismiss() {
        manager?.textField?.resignFirstResponder()
    }
}
extension UXTextField {
    public static func field(text: String = "",
                      textColor: UIColor = UIColor.black,
                      background: UIColor = UIColor.white,
                      font: UIFont = UIFont.systemFont(ofSize: 18),
                      placeholder: String = "",
                      alignment: NSTextAlignment = .left,
                      isSecure: Bool = false,
                      visible: Bool = true,
                      dismissOnEnter: Bool = true,
                      returnType: UIReturnKeyType = .default) -> UXTextField {
        let field = UXTextField()
        field.textColor = textColor
        field.backgroundColor = background
        field.font = font
        field.returnKeyType = returnType
        field.alpha = visible ? 1.0 : 0.0
        field.placeholder = placeholder
        field.textAlignment = alignment
        field.isSecureTextEntry = isSecure
        field.dismissOnEnter = dismissOnEnter
        let manager = TextManager(field: field)
        field.manager = manager
        field.delegate = manager
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }
}

