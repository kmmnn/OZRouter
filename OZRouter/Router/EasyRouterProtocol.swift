//
//  RouterProtocol.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//

public protocol RouterProtocol {
    func filter(parameters: Dictionary<String, Any>?)-> Bool
    func receiver(parameters: Dictionary<String, Any>?)-> Bool
}

extension RouterProtocol{
    func filter(parameters: Dictionary<String, Any>?)-> Bool{
        return true
    }
    
    func receiver(parameters: Dictionary<String, Any>?)-> Bool{
        return true
    }
}
