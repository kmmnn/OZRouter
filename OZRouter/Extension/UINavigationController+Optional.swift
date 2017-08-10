//
//  UINavigationController+Optional.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//

import UIKit

extension UINavigationController{
    open func pushViewController(_ viewController: UIViewController?){
        guard viewController != nil else {
            return
        }
        self.pushViewController(viewController!, animated: true)
    }
}
