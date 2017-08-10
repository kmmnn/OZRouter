//
//  Router.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//

import UIKit

open class EasyRouter {
    open static let `default` = EasyRouter()
    
    struct RouterItem {
        let storyBoard: String
        let storyBoardID: String
    }
    
    private(set) var routerMap = [String: RouterItem]()
    
    open func map(_ url: String, to storyBoard: String, withID storyBoardID: String){
        routerMap[url] = RouterItem(storyBoard: storyBoard, storyBoardID: storyBoardID)
    }
    
    open func gain(_ url: String)-> UIViewController?{
        return gain(url, withInfo: nil)
    }
    
    open func gain(_ url: String,withInfo parameters: Dictionary<String, Any>?)-> UIViewController?{
        guard let item = routerMap[url] else {
            return nil
        }
        var targetViewController: UIViewController
        if item.storyBoardID.characters.count > 0 {
            targetViewController = UIStoryboard(name: item.storyBoard, bundle: nil)
            .instantiateViewController(withIdentifier: item.storyBoardID)
        }else{
            targetViewController = UIStoryboard(name: item.storyBoard, bundle: nil)
                .instantiateInitialViewController()!
        }
        
        guard match(targetViewController: targetViewController, parameters: parameters) else {
            return nil
        }
        
        return targetViewController
    }
    
    open func match(targetViewController: UIViewController, parameters: Dictionary<String, Any>?)-> Bool{
        guard targetViewController is RouterProtocol else {
            return true
        }
        return (targetViewController as! RouterProtocol).filter(parameters: parameters) &&
            (targetViewController as! RouterProtocol).receiver(parameters: parameters)
    }
    
}


public let Router = EasyRouter.default
