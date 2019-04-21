//
//  UXTextView.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
public class UXTextView: UITextView {
    private var manager: TextViewManager?
    public var textValue: Box<(String)> = Box("")
    var dismissOnEnter: Bool = false
    public static func managedTextView(text: String = "",
                                       textColor: UIColor = UIColor.black,
                                       background: UIColor = UIColor.white,
                                       font: UIFont = UIFont.systemFont(ofSize: 18),
                                       alignment: NSTextAlignment = .left,
                                       isSecure: Bool = false,
                                       visible: Bool = true,
                                       dismissOnEnter: Bool = true) -> UXTextView {
        let view = UXTextView()
        view.textColor = textColor
        view.backgroundColor = background
        view.font = font
        view.alpha = visible ? 1.0 : 0.0
        view.textAlignment = alignment
        view.isSecureTextEntry = isSecure
        view.dismissOnEnter = dismissOnEnter
        let manager = TextViewManager(textView: view)
        view.manager = manager
        view.delegate = manager
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
