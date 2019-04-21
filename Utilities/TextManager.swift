//
//  TextManager.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
public class TextManager: NSObject, UITextFieldDelegate {
    public weak var textField: UXTextField?
    init(field: UXTextField) {
        self.textField = field
    }
    private func textFieldDidEndEditing(_ textField: UITextField) {
        guard let field = self.textField else { return}
        let currentText = field.text ?? ""
        if field.dismissOnEnter {
            field.finalTextValue.accept(currentText)
        }
    }
    private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = self.textField else { return false}
        let currentText = field.text ?? ""
        if field.dismissOnEnter && string == "\n" {
            field.resignFirstResponder();
            field.finalTextValue.accept(currentText)
            return false
        }
        field.textValue.accept(currentText.appending(string))
        return true
    }
}
