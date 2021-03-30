//
//  LHTableView.swift
//  
//
//  Created by laohanme on 03/09/2020.
//

import Foundation
import UIKit

// MARK: Extension TableView
/// Let UITableView more intuitive
@available(iOS 10, *)
public extension UITableView {
    
    // MARK: Empty View
    /// Use to show empty view if table data is empty
    func emptyView(title: String, subtitle: String? = nil) {
        let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        // Title
        let emptyTitle = UILabel()
        if #available(iOS 13, *) {
            emptyTitle.textColor = .label
        } else {
            emptyTitle.textColor = .black
        }
        emptyTitle.font = .systemFont(ofSize: 17, weight: .semibold)
        emptyTitle.numberOfLines = .max
        
        // Subtitle
        let emptySubtitle = UILabel()
        emptySubtitle.textColor = .lightGray
        emptySubtitle.font = .systemFont(ofSize: 15, weight: .regular)
        emptySubtitle.numberOfLines = .max
        
        view.addSubview(emptyTitle)
        view.addSubview(emptySubtitle)
        
        emptyTitle.translatesAutoresizingMaskIntoConstraints = false
        emptySubtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            emptySubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptySubtitle.topAnchor.constraint(equalTo: emptyTitle.bottomAnchor, constant: 5)
        ])

        self.backgroundView = view
        
        emptyTitle.text = title
        emptySubtitle.text = subtitle ?? ""
    }
    
    // MARK: Restore TableView
    func restore() {
        self.backgroundView = nil
    }
    
}
