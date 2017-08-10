//
//  ValueViewController.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//

import UIKit

class ValueViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    var value = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = value
    }
}

extension ValueViewController: RouterProtocol{
    func receiver(parameters: Dictionary<String, Any>?) -> Bool {
        guard parameters != nil else {
            return false
        }
        value = parameters!["value"] as! String
        return true
    }

}
