//
//  LHAlert.swift
//  
//
//  Created by laohanme on 20/06/2020.
//  Inspire by Sean Allen https://youtu.be/ZBS2uRP6_2U

import Foundation
import UIKit

// TODO: Need Complete

public enum LHAlertType {
    case type1(title: String, msg: String)
}


public struct LHAlert {
    
    static func popAlert(_ vc: UIViewController, type: LHAlertType) {
        switch type {
        case let .type1(title, msg)
            commonAlert(on: vc, title: title, message: msg)
        default:
            break
        }
    }
    
    private static func commonAlert(on vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
}
