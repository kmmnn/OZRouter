//
//  EasyRouterParser.swift
//  OZRouter
//
//  Created by oliver.zhai on 2017/8/10.
//  Copyright © 2017年 cmdt. All rights reserved.
//
import  UIKit

struct EasyRouterParser {
    static func initialize(with plistName: String = "Router") {
        guard let plistPath = Bundle.main.path(forResource: plistName, ofType: "plist") else{
            return
        }
        guard let routerForm = NSDictionary(contentsOfFile: plistPath) else{
            return
        }
        
        
        for routerItem in routerForm{
            guard let url = routerItem.key as? String, let id = routerItem.value as? String else {
                continue
            }
            //            if routerItem.value
            
            var storyBoard = ""
            var storyBoardID = ""
            let ids = id.components(separatedBy: ",")
            storyBoard =  ids.first!
            if ids.count >= 2 {
                storyBoardID = ids[1]
            }
            Router.map(url, to: storyBoard, withID: storyBoardID)
        }
    }
}
