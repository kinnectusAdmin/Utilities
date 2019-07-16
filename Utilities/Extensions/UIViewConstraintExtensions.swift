//
//  UIViewConstraintExtensions.swift
//  Utilities
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIView {
    /// Constrain a views bottom margin directly to anothers, set constant for offsetting
    /// Returns bottom Constraint
    public func returnConstrainViewToBottom(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain a view to a height value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    /// Returns height Constraint
    public func returnConstrainViewHeight(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the bottom margin of a view to the top margin of another
    /// Returns top Constraint
    public func returnConstrainTopToBottom(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the top margin of a view to the top margin of another
    /// Returns top Constraint
    public func returnConstrainTopToTop(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the top margin of a view to the mid y of another view
    /// Returns top Constraint
    public func returnConstrainTopToMid(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain bottom margin of  view to the top of another view
    /// Returns bottom Constraint
    public func returnConstrainBottomToTop(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain bottom margin of  view to the bottom of another view
    /// Returns bottom Constraint
    public func returnConstrainBottomToBottom(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain bottom margin of  view to the mid y of another view
    /// Returns bottom Constraint
    public func returnConstrainBottomToMid(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the left margin of a view to the left margin of another view
    /// Returns left Constraint
    public func returnConstrainLeftToLeft(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the left margin of a view to the right margin of another view
    /// Returns left Constraint
    public func returnConstrainLeftToRight(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the right margin of a view to the right margin of another view
    /// Returns right Constraint
    public func returnConstrainRightToRight(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the right margin of a view to the left margin of another view
    /// Returns right Constraint
    public func returnConstrainRightToLeft(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the left margin of a view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The offsetting constant which will be applied to the left anchor
    /// Returns left Constraint
    public func returnConstrainLeftToMid(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the right margin of a view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midx offsetting constant applied to the rightanchor
    /// Returns right Constraint
    public func returnConstrainRightToMid(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain a view to the mid y of another
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midY offsetting constant applied
    /// Returns center Constraint
    public func returnConstrainCenterYTo(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the mid x view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midX offsetting constant
    /// Returns center X Constraint
    public func returnConstrainCenterXTo(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain a view to a width value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    ///
    /// - Parameter constant: The width constant to constrain the view to
    /// Returns width Constraint
    public func returnConstrainViewWidth(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain a views bottom margin directly to anothers, set constant for offsetting
    func constrainViewToBottom(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    /// Aligns subviews based on predetermined constraint setting for edges
    ///
    /// - Parameters:
    ///   - layout: ViewAlignment
    ///   - views: UIViews...
    public func layoutSubView(layout: ViewAlignment, views: UIView...) {
        _ = views.map { view in
            if !view.isDescendant(of: self) {
                addSubview(view)
            }
        }
        switch layout {
        case .fill:
            _ = views.map { view in
                view.constrainInView(view: self, top: 0, left: 0, right: 0, bottom: 0)
            }
        case .leftTop:
            _ = views.map { view in
                view.constrainInView(view: self, top: 0, left: 0)
            }
        case .rightTop:
            _ = views.map { view in
                view.constrainInView(view: self, top: 0, right: 0)
            }
        case .leftTopRight:
            _ = views.map { view in
                view.constrainInView(view: self, top: 0, left: 0, right: 0)
            }
        case .leftBottom:
            _ = views.map { view in
                view.constrainInView(view: self, left: 0, bottom: 0)
            }
        case .rightBottom:
            _ = views.map { view in
                view.constrainInView(view: self, right: 0, bottom: 0)
            }
        case .leftBottomRight:
            _ = views.map { view in
                view.constrainInView(view: self, left: 0, right: 0, bottom: 0)
            }
        case .leftRight:
            _ = views.map { view in
                view.constrainInView(view: self, left: 0, right: 0)
            }
        case .topBottom:
            _ = views.map { view in
                view.constrainInView(view: self, top: 0, bottom: 0)
            }
        }
    }
    /// Aligns all views to a particular set point
    ///
    /// - Parameters:
    ///   - position: ViewPosition
    ///   - setting: CGFloat
    ///   - views: UIView
    public func alignAllViews(position: ViewPosition, offset: CGFloat, views: UIView...) {
        _ = views.map {
            alignViews(position: position, (offset, $0))
        }
    }
    /// Constrains a collection of views bottom margin directly to another, set constant for offsetting
    ///
    /// - Parameter arrangements: (CGFloat, UIView)
    // swiftlint:disable :next cyclomatic_complexity
    public func alignViews(position: ViewPosition, _ arrangements: (CGFloat, UIView)...) {
        switch position {
        case .top:
            _ = arrangements.map { arrangement in
                arrangement.1.topAnchor.constraint(equalTo: self.topAnchor, constant: arrangement.0).isActive = true
            }
        case .bottom:
            _ = arrangements.map { arrangement in
                arrangement.1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: arrangement.0).isActive = true
            }
        case .right:
            _ = arrangements.map { arrangement in
                arrangement.1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: arrangement.0).isActive = true
            }
        case .left:
            _ = arrangements.map { arrangement in
                arrangement.1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: arrangement.0).isActive = true
            }
        case .topsToBottom:
            _ = arrangements.map { arrangement in
                arrangement.1.topAnchor.constraint(equalTo: self.bottomAnchor, constant: arrangement.0).isActive = true
            }
        case .bottomsToTop:
            _ = arrangements.map { arrangement in
                arrangement.1.bottomAnchor.constraint(equalTo: self.topAnchor, constant: arrangement.0).isActive = true
            }
        case .centerX:
            _ = arrangements.map { arrangement in
                arrangement.1.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: arrangement.0).isActive = true
            }
        case .centerY:
            _ = arrangements.map { arrangement in
                arrangement.1.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: arrangement.0).isActive = true
            }
        case .centerAll:
            _ = arrangements.map { arrangement in
                arrangement.1.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: arrangement.0).isActive = true
                arrangement.1.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: arrangement.0).isActive = true
            }
        case .height:
            _ = arrangements.map { arrangement in
                arrangement.1.heightAnchor.constraint(equalToConstant: arrangement.0).isActive = true
                arrangement.1.heightAnchor.constraint(equalToConstant: arrangement.0).isActive = true
            }
        case .width:
            _ = arrangements.map { arrangement in
                arrangement.1.widthAnchor.constraint(equalToConstant: arrangement.0).isActive = true
                arrangement.1.widthAnchor.constraint(equalToConstant: arrangement.0).isActive = true
            }
        }
    }
    /// Constrain a view to a height value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    public func constrainViewHeight(to constant: CGFloat, with priority: Float = 1000) {
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.priority =  UILayoutPriority(priority)
        constraint.isActive = true
    }
    /// Constrain the bottom margin of a view to the top margin of another
    public func constrainTopToBottom(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    /// Constrain the bottom margin of a view to the top margin of another and return constraint
    public func returnConstraitTopToBottom(of view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    /// Constrain the top margin of a view to the top margin of another
    public func constrainTopToTop(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    /// Constrain the top margin of a view to the mid y of another view
    public func constrainTopToMid(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    // Constrain the top margin of a view to the mid y of another view
    public func constrainMidToBottom(of view: UIView, constant: CGFloat) {
        self.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }// Constrain the top margin of a view to the mid y of another view
    public func constrainMidToTop(of view: UIView, constant: CGFloat) {
        self.centerYAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    /// Constrain bottom margin of  view to the top of another view
    public func constrainBottomToTop(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    /// Constrain bottom margin of  view to the bottom of another view
    public func constrainBottomToBottom(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    /// Constrain bottom margin of  view to the mid y of another view
    public func constrainBottomToMid(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    /// Constrain the left margin of a view to the left margin of another view
    public func constrainLeftToLeft(of view: UIView, constant: CGFloat) {
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
    }
    /// Constrain the left margin of a view to the right margin of another view
    public func constrainLeftToRight(of view: UIView, constant: CGFloat) {
        self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true
    }
    /// Constrain the right margin of a view to the right margin of another view
    public func constrainRightToRight(of view: UIView, constant: CGFloat) {
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true
    }
    /// Constrain the right margin of a view to the left margin of another view
    public func constrainRightToLeft(of view: UIView, constant: CGFloat) {
        self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
    }
    /// Constrain the left margin of a view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The offsetting constant which will be applied to the left anchor
    public func constrainLeftToMid(of view: UIView, constant: CGFloat) {
        self.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    /// Constrain the right margin of a view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midx offsetting constant applied to the rightanchor
    public func constrainRightToMid(of view: UIView, constant: CGFloat) {
        self.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    /// Constrain a view to the mid y of another
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midY offsetting constant applied
    public func constrainCenterYTo(view: UIView, constant: CGFloat) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    /// Constrain the mid x view to the mid x of another view
    ///
    /// - Parameters:
    ///   - view: The view to which the constraining view will be matched
    ///   - constant: The midX offsetting constant
    public func constrainCenterXTo(view: UIView, constant: CGFloat) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    public func constrainCenterToCenter(of view: UIView, dx: CGFloat = 0, dy: CGFloat = 0) {
        self.constrainCenterXTo(view: view, constant: dx)
        self.constrainCenterYTo(view: view, constant: dy)
    }
    /// Constrain a view top, left, right and bottom to those of another view
    ///
    /// - Parameters:
    ///   - view: The super view or view to which a particular view will be constrained within
    ///   - top: The top anchor constant from the superviews topanchor
    ///   - left: The left anchor constant from the superviews leftAnchor
    ///   - right: The right anchor constant from the superviews rightAnchor
    ///   - bottom: The bottom anchor constant from the superviews bottom Anchor
    public func constrainSafelyInView(view: UIView, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        if let topConstraint = top {
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraint).isActive = true
            } else {
                // Fallback on earlier versions
                topAnchor.constraint(equalTo: view.topAnchor, constant: topConstraint).isActive = true
            }
        }
        if let leftConstant = left {
            constrainLeftToLeft(of: view, constant: leftConstant)
        }
        if let rightConstant = right {
            constrainRightToRight(of: view, constant: rightConstant)
        }
        if let bottomConstant = bottom {
            if #available(iOS 11.0, *) {
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomConstant).isActive = true
            } else {
                // Fallback on earlier versions
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant).isActive = true
            }
        }
    }
    /// Constrain a view top, left, right and bottom to those of another view
    ///
    /// - Parameters:
    ///   - view: The super view or view to which a particular view will be constrained within
    ///   - top: The top anchor constant from the superviews topanchor
    ///   - left: The left anchor constant from the superviews leftAnchor
    ///   - right: The right anchor constant from the superviews rightAnchor
    ///   - bottom: The bottom anchor constant from the superviews bottom Anchor
    public func constrainInView(view: UIView, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        if let topConstraint = top {
            topAnchor.constraint(equalTo: view.topAnchor, constant: topConstraint).isActive = true
        }
        if let leftConstant = left {
            constrainLeftToLeft(of: view, constant: leftConstant)
        }
        if let rightConstant = right {
            constrainRightToRight(of: view, constant: rightConstant)
        }
        if let bottomConstant = bottom {
            constrainViewToBottom(of: view, constant: bottomConstant)
        }
    }
    /// Constrain a view to a width value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    ///
    /// - Parameter constant: The width constant to constrain the view to
    public func constrainViewWidth(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    /// Constrain a view to a views width value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    ///
    /// - Parameter constant: The width constant to constrain the view to
    public func constrainViewWidthTo(view: UIView, constant: CGFloat = 0, multiplier: CGFloat = 1.0) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
    /// Constrain a view to a height & width value directly, view must have translatesAutoresizingMaskIntoConstraints to false
    /// - Parameters:
    ///   - width: The width constant to constrain the view to
    ///   - height: The height constant to constrain the view to
    public func constrainWidth_Height(width: CGFloat, height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// Constrain a view top to the safe area top or to the top layout guide's bottom anchor
    /// - Parameters:
    ///   - anchor: The top y-axis anchor of the safe area
    public func constrainTopToSafeAreaTop(anchor: NSLayoutYAxisAnchor,
                                   spacing: CGFloat = 0, multiplier: CGFloat = 1) {
        if #available(iOS 11.0, *) {
            topAnchor.constraint(
                equalToSystemSpacingBelow: anchor, multiplier: multiplier).isActive = true
        } else {
            // Fallback on earlier versions
            topAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        }
    }
    /// Constrain a view bottom to the safe area bottom or to the bottom layout guide's top anchor
    /// - Parameters:
    ///   - anchor: The bottom y-axis anchor of the safe area
    func constrainBottomToSafeAreaBottom(anchor: NSLayoutYAxisAnchor,
                                         spacing: CGFloat = 0, multiplier: CGFloat = 1) {
        if #available(iOS 11.0, *) {
            bottomAnchor.constraint(equalToSystemSpacingBelow: anchor, multiplier: multiplier).isActive = true
        } else {
            // Fallback on earlier versions
            bottomAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        }
    }
    /// Add any number of views, from bottom to top subview respectively
    ///
    /// - Parameter views: An array of subviews to add to a superview
   public func add(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIViewController {
    /// Constrain a view top, left, right and bottom to those of another view
    ///
    /// - Parameters:
    ///   - view: The super view or view to which a particular view will be constrained within
    ///   - top: The top anchor constant from the superviews topanchor
    ///   - left: The left anchor constant from the superviews leftAnchor
    ///   - right: The right anchor constant from the superviews rightAnchor
    ///   - bottom: The bottom anchor constant from the superviews bottom Anchor
   public func constrainSubViewSafely(subView: UIView, top: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        if let topConstant = top {
            if #available(iOS 11.0, *) {
                subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant).isActive = true
            } else {
                // Fallback on earlier versions
                subView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: topConstant).isActive = true
            }
        }
        if let leftConstant = left {
            subView.constrainLeftToLeft(of: self.view, constant: leftConstant)
        }
        if let rightConstant = right {
            subView.constrainRightToRight(of: self.view, constant: rightConstant)
        }
        if let bottomConstant = bottom {
            if #available(iOS 11.0, *) {
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -bottomConstant).isActive = true
            } else {
                // Fallback on earlier versions
                self.view.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: bottomConstant).isActive = true
            }
        }
    }
}

