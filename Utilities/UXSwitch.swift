//
//  UXSwitch.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
public class UXSwitch: UISwitch {
    public typealias Action = () -> Void
    public override func layoutSubviews() {
        super.layoutSubviews()
        setActionTarget()
    }
    private var action: Action!
    @objc func initiateAction(_ sender: UXButton) {
        action?()
    }
    private func setActionTarget() {
        self.addTarget(self, action: #selector(UXSwitch.initiateAction(_:)), for: .touchUpInside)
    }
    public func setAction(_ uxAction: @escaping Action) {
        self.action = uxAction
    }
    public static func customUXSwitch(onColor: UIColor = UIColor.white, tint: UIColor = UIColor.white, background: UIColor = UIColor.white,cornerRadius: CGFloat = 0.0) -> UXSwitch {
        let swtch = UXSwitch()
        swtch.onTintColor = onColor
        swtch.tintColor = tint
        swtch.backgroundColor = background
        swtch.layer.cornerRadius = cornerRadius
        swtch.layer.masksToBounds = true
        swtch.translatesAutoresizingMaskIntoConstraints = false
        return swtch
    }
}
