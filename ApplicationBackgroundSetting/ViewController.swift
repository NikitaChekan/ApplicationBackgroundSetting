//
//  ViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by jopootrivatel on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 20
    }


}

