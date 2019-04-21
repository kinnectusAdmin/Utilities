//
//  UICollectionView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UICollectionView {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - width: <#width description#>
    ///   - height: <#height description#>
    ///   - backgroundColor: <#backgroundColor description#>
    ///   - itemSpacing: <#itemSpacing description#>
    ///   - lineSpacing: <#lineSpacing description#>
    ///   - layout: <#layout description#>
    ///   - selectionAllowed: <#selectionAllowed description#>
    ///   - direction: <#direction description#>
    ///   - paging: <#paging description#>
    /// - Returns: <#return value description#>
    static public func collectionView( width:CGFloat, height: CGFloat, backgroundColor: UIColor = UIColor.white, itemSpacing: CGFloat = 0, lineSpacing: CGFloat = 0, layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout(), selectionAllowed: Bool = true, direction: UICollectionView.ScrollDirection, paging: Bool = false) -> UICollectionView {
        layout.scrollDirection = direction
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = lineSpacing
        let frame = CGRect(x: 0, y: 0, width:width, height: height)
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = backgroundColor
        cv.allowsMultipleSelection = selectionAllowed
        cv.isPagingEnabled = paging
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }
}
