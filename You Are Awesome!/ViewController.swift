//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Alice Liang on 1/13/19.
//  Copyright © 2019 Alice Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showMessagePressed(_ sender: UIButton) {
       messageLabel.text = "You Are Awesome!"
       messageLabel.textColor = UIColor.red
    }
    @IBAction func showAnotherMessagePressed(_ sender: UIButton) {
       messageLabel.text = "You Are Great!"
       messageLabel.textColor = UIColor.blue
    }
    
}

