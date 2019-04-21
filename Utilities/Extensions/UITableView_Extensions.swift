//
//  UITableView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UITableView {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - separator: <#separator description#>
    ///   - background: <#background description#>
    ///   - visible: <#visible description#>
    ///   - selectionIsMultiple: <#selectionIsMultiple description#>
    /// - Returns: <#return value description#>
    static public func tableView(separator: UITableViewCell.SeparatorStyle = .none, background: UIColor = UIColor.clear, visible: Bool = true, selectionIsMultiple: Bool = false) -> UITableView {
        let tableview = UITableView()
        tableview.separatorStyle = separator
        tableview.backgroundColor = background
        tableview.alpha = visible ? 1.0 : 0.0
        tableview.allowsMultipleSelection = selectionIsMultiple
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }
}
