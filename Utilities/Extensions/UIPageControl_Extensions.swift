//
//  UIPageControl_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/21/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIPageControl {
    static public func view(count: Int, firstIndex: Int, tint: UIColor, currentTint: UIColor) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = count
        pageControl.currentPage = firstIndex
        pageControl.pageIndicatorTintColor = tint
        pageControl.currentPageIndicatorTintColor = currentTint
        return pageControl
    }
}
