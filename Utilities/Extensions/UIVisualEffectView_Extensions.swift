//
//  UIVisualEffectView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 6/14/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit

extension UIVisualEffectView {
    public static func view(style: UIBlurEffect.Style, radius: CGFloat = 0.0) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: blurEffect)
        view.layer.cornerRadius = radius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
