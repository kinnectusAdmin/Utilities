//
//  UIViewExtensions.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIView {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - background: <#background description#>
    ///   - isVisible: <#isVisible description#>
    ///   - radius: <#radius description#>
    /// - Returns: <#return value description#>
    static public func container(background: UIColor = UIColor.white, isVisible: Bool = true, radius: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = background
        view.alpha = isVisible ? 1.0 : 0.0
        view.layer.cornerRadius = radius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    /// Creates a container view programmatically that can be styled sparsely
    ///
    /// - Parameter background: The background color with which to set the view
    /// - Parameter radius: The Corner radius with which to set the view layer
    /// - Returns: Returns a uiview that can immediately be constrained
    public static func vibrantContainerView(background: UIColor = UIColor.white, radius: CGFloat = 0.0, isVisible: Bool = true, willUtilizeConstraints: Bool = true) -> UIView {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        let screen = UIView.containerView(background: background)
        let view = UIView()
        view.add(views: blurView, screen)
        view.clipsToBounds = true
        blurView.constrainInView(view: view, top: 0, left: 0, right: 0, bottom: 0)
        screen.constrainInView(view: view, top: 0, left: 0, right: 0, bottom: 0)
        view.layer.cornerRadius = radius
        view.alpha = isVisible ? 1.0 : 0.0
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = willUtilizeConstraints ?  false : true
        return view
    }
    /// <#Description#>
    public func removeAllGestures() {
        for gesture in gestureRecognizers ?? [] {
            removeGestureRecognizer(gesture)
        }
    }
}
extension UIView {
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this public function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - view1: <#view1 description#>
    ///   - view2: <#view2 description#>
    public func constrainHorizontallyBetween(view1: UIView, view2: UIView) {}
    public enum ViewPosition {
        case top
        case left
        case right
        case bottom
        case topsToBottom
        case bottomsToTop
        case centerX
        case centerY
        case centerAll
        case height
        case width
    }
    public enum ViewAlignment {
        case fill
        case leftTop
        case rightTop
        case leftTopRight
        case leftBottom
        case rightBottom
        case leftBottomRight
        case leftRight
        case topBottom
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - view1: <#view1 description#>
    ///   - viewPosition1: <#viewPosition1 description#>
    ///   - view2: <#view2 description#>
    ///   - viewPosition2: <#viewPosition2 description#>
    public func constrainVerticallyBetween(view1: UIView, at viewPosition1: ViewPosition, view2: UIView, at viewPosition2: ViewPosition) {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        guard let superView = superview else { return}
        superView.add(views: containerView,self)
        switch viewPosition1{
        case .top:
            containerView.setTopTo(con: view1.top(), by: 0)
        case .bottom:
            containerView.setTopTo(con: view1.bottom(), by: 0)
        default: break
        }
        switch viewPosition2{
        case .top:
            containerView.setBottomTo(con: view2.top(), by: 0)
        case .bottom:
            containerView.setBottomTo(con: view2.bottom(), by: 0)
        default: break
        }
        self.setYTo(con: containerView.y(), by: 0)
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func left()->NSLayoutXAxisAnchor{
        return leftAnchor
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func right()->NSLayoutXAxisAnchor{
        return rightAnchor
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func top()->NSLayoutYAxisAnchor{
        return topAnchor
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func bottom()->NSLayoutYAxisAnchor{
        return bottomAnchor
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func x()->NSLayoutXAxisAnchor{
        return centerXAnchor
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func y()->NSLayoutYAxisAnchor{
        return centerYAnchor
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setTopTo(con: NSLayoutYAxisAnchor, by: CGFloat) {
        topAnchor.constraint(equalTo: con, constant: by).isActive = true
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setLeftTo(con: NSLayoutXAxisAnchor, by: CGFloat) {
        leftAnchor.constraint(equalTo: con, constant: by).isActive = true
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setRightTo(con: NSLayoutXAxisAnchor, by: CGFloat) {
        rightAnchor.constraint(equalTo: con , constant: by).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setXTo(con: NSLayoutXAxisAnchor, by: CGFloat) {
        centerXAnchor.constraint(equalTo: con , constant: by ).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setYTo(con: NSLayoutYAxisAnchor, by: CGFloat) {
        centerYAnchor.constraint(equalTo: con , constant: by).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    public func setBottomTo(con: NSLayoutYAxisAnchor, by: CGFloat) {
        bottomAnchor.constraint(equalTo: con , constant: by).isActive = true
        
    }
    /// <#Description#>
    ///
    /// - Parameter constant: <#constant description#>
    public func setHeightTo(constant: CGFloat) {
        let con = heightAnchor.constraint(equalToConstant: constant)
        con.isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameter constant: <#constant description#>
    public func setWidthTo(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    
    /*------------CONSTRAINTS WITH A RETURN ----------------------------*/
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setTopTo_Return(con: NSLayoutYAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        let con = topAnchor.constraint(equalTo: con, constant: by)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setLeftTo_Return(con: NSLayoutXAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        let con = leftAnchor.constraint(equalTo: con, constant: by)
        con.isActive = true
        return con
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setRightTo_Return(con: NSLayoutXAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        let con = rightAnchor.constraint(equalTo: con , constant: by)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setXTo_Return(con: NSLayoutXAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        
        let con = centerXAnchor.constraint(equalTo: con , constant: by )
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setYTo_Return(con: NSLayoutYAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        let con = centerYAnchor.constraint(equalTo: con , constant: by)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - con: <#con description#>
    ///   - by: <#by description#>
    /// - Returns: <#return value description#>
    public func setBottomTo_Return(con: NSLayoutYAxisAnchor, by: CGFloat)->NSLayoutConstraint{
        let con = bottomAnchor.constraint(equalTo: con , constant: by)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameter constant: <#constant description#>
    /// - Returns: <#return value description#>
    public func setHeightTo_Return(constant: CGFloat)->NSLayoutConstraint{
        let con = heightAnchor.constraint(equalToConstant: constant)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameter constant: <#constant description#>
    /// - Returns: <#return value description#>
    public func setWidthTo_Return(constant: CGFloat)->NSLayoutConstraint{
        
        let con = widthAnchor.constraint(equalToConstant: constant)
        con.isActive = true
        return con
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - width: <#width description#>
    ///   - height: <#height description#>
    public func setWidth_Height(width: CGFloat, height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - top: <#top description#>
    ///   - left: <#left description#>
    ///   - right: <#right description#>
    ///   - bottom: <#bottom description#>
    public func constrainToViews(top:(UIView,CGFloat),left: (UIView,CGFloat),right:(UIView,CGFloat),bottom: (UIView,CGFloat)) {
        topAnchor.constraint(equalTo:bottom.0.layoutMarginsGuide.bottomAnchor, constant: top.1).isActive = true
        leftAnchor.constraint(equalTo: left.0.layoutMarginsGuide.leftAnchor, constant: left.1).isActive = true
        rightAnchor.constraint(equalTo: right.0.layoutMarginsGuide.rightAnchor, constant: right.1).isActive = true
        bottomAnchor.constraint(equalTo: top.0.layoutMarginsGuide.topAnchor, constant: bottom.1).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - view: <#view description#>
    ///   - width: <#width description#>
    ///   - height: <#height description#>
    public func constrainWithMultiplier(view: UIView,width:CGFloat,height: CGFloat) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width).isActive = true
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - type: <#type description#>
    ///   - withView: <#withView description#>
    ///   - toView: <#toView description#>
    ///   - plusMinus: <#plusMinus description#>
    public func addConstraintForViews(_ type:NSLayoutConstraint.Attribute,withView: UIView, toView:UIView?,plusMinus: CGFloat) {
        addConstraint(NSLayoutConstraint(item: withView, attribute: type, relatedBy: .equal, toItem: toView , attribute: type, multiplier: 1, constant: plusMinus))
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - type: <#type description#>
    ///   - type2: <#type2 description#>
    ///   - withView: <#withView description#>
    ///   - toView: <#toView description#>
    public func joinViewsWithConstraint(_ type:NSLayoutConstraint.Attribute,type2:NSLayoutConstraint.Attribute,withView: UIView,toView: UIView) {
        addConstraint(NSLayoutConstraint(item: withView, attribute: type, relatedBy: .equal, toItem: toView , attribute: type2, multiplier: 1, constant:0))
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - constraint: <#constraint description#>
    ///   - views: <#views description#>
    public func addVisualConstraints(_ constraint: String, views: UIView...) {
        var constraintDictionary = [String: UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            constraintDictionary.updateValue(view, forKey: key)
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraint, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: constraintDictionary))
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - background: <#background description#>
    ///   - alpha: <#alpha description#>
    /// - Returns: <#return value description#>
    static public func containerView(background: UIColor = UIColor.white, alpha: CGFloat = 1.0, radius: CGFloat = 0.0, borderWidth: CGFloat = 1.0, borderColor: UIColor = .clear) -> UIView {
        let view = UIView()
        view.backgroundColor = background
        view.alpha = alpha
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        view.layer.cornerRadius = radius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
