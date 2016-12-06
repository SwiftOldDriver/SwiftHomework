//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by nero on 2016/12/6.
//  Copyright © 2016年 nero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(shortcutItem.handleShortCutItem())
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let launchedShortcutItem = launchOptions?[.shortcutItem] as? UIApplicationShortcutItem
        launchedShortcutItem?.handleShortCutItem()
        
        return true
    }
    
}

