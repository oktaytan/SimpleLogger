//
//  ViewController.swift
//  Logger
//
//  Created by Oktay Tanrıkulu on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Logger.info("Info log test")
        Logger.warning("Warning log test without scope", showScope: false)
        Logger.error("Error log test")
    }
}

