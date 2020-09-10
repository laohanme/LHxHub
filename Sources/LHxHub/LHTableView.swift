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
    func emptyView(img: UIImage, title: String, subtitle: String) {
        let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        // Image View
        let image = UIImageView()
        image.image = img
        image.contentMode = .scaleAspectFill
        
        // Title
        let emptyTitle = UILabel()
        if #available(iOS 13, *) {
            emptyTitle.textColor = .label
        } else {
            emptyTitle.textColor = .black
        }
        emptyTitle.font = .systemFont(ofSize: 20, weight: .semibold)
        emptyTitle.numberOfLines = .max
        
        // Subtitle
        let emptySubtitle = UILabel()
        emptySubtitle.textColor = .lightGray
        emptySubtitle.font = .systemFont(ofSize: 15, weight: .regular)
        emptySubtitle.numberOfLines = .max
        
        view.addSubview(image)
        view.addSubview(emptyTitle)
        view.addSubview(emptySubtitle)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        emptyTitle.translatesAutoresizingMaskIntoConstraints = false
        emptySubtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            emptyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 50),
            
            emptySubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptySubtitle.topAnchor.constraint(equalTo: emptyTitle.bottomAnchor, constant: 5)
        ])

        self.backgroundView = view
        
        emptyTitle.text = title
        emptySubtitle.text = subtitle
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
}
