//
//  ViewController.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func next(_ sender: UIButton) {
        navigationController?.pushViewController(Router.gain("router://home/sec"))
    }
    
    @IBAction func valueNext(_ sender: UIButton) {
        let url = "router://home/value"
        let info = ["value": textField.text!]
         navigationController?.pushViewController(Router.gain(url, withInfo: info))
    }
}
