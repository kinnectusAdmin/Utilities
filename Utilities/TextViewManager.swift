//
//  TextViewManager.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
class TextViewManager: NSObject, UITextViewDelegate {
    var textView: UXTextView
    init(textView: UXTextView) {
        self.textView = textView
    }
    func textViewDidChange(_ textView: UITextView) {
        self.textView.textValue.accept((textView.text ?? ""))
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if self.textView.dismissOnEnter && text == "\n" { self.textView.resignFirstResponder(); return false }
        return true
    }
}
