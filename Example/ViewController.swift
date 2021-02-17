//
//  ViewController.swift
//  Example
//
//  Created by laohanme on 06/05/2020.
//  Copyright © 2020 laohanme. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LHxHub"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        LHAlert.popAlert(self, type: .confirmation(title: "Hello World", msg: "This is new message")) {
            print($0)
        }
        
    }

}

