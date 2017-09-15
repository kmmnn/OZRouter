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
            print("路由失败:URL未注册")
            return nil
        }
        var targetViewController: UIViewController?
        guard item.storyBoard.characters.count > 0 else{
            print("路由失败:StoryBoard未注册")
            return nil
        }
        let targetStoryboard = UIStoryboard(name: item.storyBoard, bundle: nil)
        if item.storyBoardID.characters.count > 0 {
            targetViewController = targetStoryboard.instantiateViewController(withIdentifier: item.storyBoardID)
        }else{
            targetViewController = targetStoryboard.instantiateInitialViewController()
        }
        guard targetViewController != nil else {
            print("路由失败:未找到targetViewController")
            return nil
        }
        guard match(targetViewController: targetViewController!, parameters: parameters) else {
            print("路由失败:目标VC拦截请求")
            return nil
        }
        
        return targetViewController
    }
    
    open func match(targetViewController: UIViewController, parameters: Dictionary<String, Any>?)-> Bool{
        guard targetViewController is RouterProtocol else {
            return true
        }
        let receiver = (targetViewController as! RouterProtocol).receiver(parameters: parameters)
        let filter = (targetViewController as! RouterProtocol).filter(parameters: parameters)
        return receiver && filter
    }
    
}


public let Router = EasyRouter.default
