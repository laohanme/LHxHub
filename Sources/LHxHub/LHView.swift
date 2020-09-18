//
//  LHView.swift
//  
//
//  Created by laohanme on 18/09/2020.
//

import UIKit

public extension UIView {
    
    // MARK: Simpple and easy to add more subviews in one line code
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
