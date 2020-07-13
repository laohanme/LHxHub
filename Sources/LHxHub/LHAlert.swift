//
//  LHAlert.swift
//  
//
//  Created by laohanme on 20/06/2020.
//  Inspire by Sean Allen https://youtu.be/ZBS2uRP6_2U

import Foundation
import UIKit

// MARK: Alert Type
public enum LHAlertType {
    /// info alert is just mainly use to make acknowledge
    case info(title: String, msg: String)
    /// confirmation alert make decision
    case confirmation(title: String, msg: String)
}

public struct LHAlert {
    
    static func popAlert(_ vc: UIViewController, type: LHAlertType, cb: @escaping(Bool)->()) {
        switch type {
        case let .info(title, msg):
            infoAlert(on: vc, title: title, message: msg) {
                cb($0)
            }
        case let .confirmation(title, msg):
            confirmationAlert(on: vc, title: title, message: msg) {
                cb($0)
            }
        }
    }
    
    private static func infoAlert(on vc: UIViewController, title: String, message: String, cb: @escaping(Bool)->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in cb(true) }))
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    private static func confirmationAlert(on vc: UIViewController, title: String, message: String, cb: @escaping(Bool)->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in cb(false) }))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in cb(true) }))
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
}
