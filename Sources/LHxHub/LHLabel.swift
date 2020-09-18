//
//  LHLabel.swift
//  
//
//  Created by laohanme on 17/09/2020.
//

import UIKit

public extension UILabel {

    // MARK: Animate text label
    func animateLabel(label: String, delay: TimeInterval) {
        DispatchQueue.main.async {
            self.text = ""
            for (index, character) in label.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }

}
