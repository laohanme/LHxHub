//
//  LHView.swift
//  
//
//  Created by laohanme on 18/09/2020.
//

import UIKit

public extension UIView {
    
    // MARK: Simple and easy to add more subviews in one line code
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

@available(iOS 9.0, *)
public extension UIStackView {
    
    // MARK: Simple and easy to add arranged subviews in one line code
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
