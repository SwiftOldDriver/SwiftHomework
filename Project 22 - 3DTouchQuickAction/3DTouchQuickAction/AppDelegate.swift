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
    
    enum ShortcutIdentifier: String {
        case first
        case second
        case third
        
        init?(fullType: String) {

            guard let last = fullType.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: last)
        }
        
    }
    var window: UIWindow?
    
    var launchedShortcutItem: UIApplicationShortcutItem?
    
    @discardableResult
    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {

        guard let shortcutItem = ShortcutIdentifier(fullType: shortcutItem.type)  else {
            return false
        }
        
        let vc:UIViewController
        
        switch shortcutItem {
        case .first:
            vc = UIStoryboard(storyboard: .Main).instantiateViewController(withIdentifier: RunViewController.storyboardIdentifier)
        case .second:
            vc = UIStoryboard(storyboard: .Main).instantiateViewController(withIdentifier: ScanViewController.storyboardIdentifier)
        case .third:
            vc = UIStoryboard(storyboard: .Main).instantiateViewController(withIdentifier: SwitchWiFiViewController.storyboardIdentifier)
        }
        
        // Display the selected view controller
        window?.rootViewController = vc

        return true
    }
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(handleShortCutItem(shortcutItem))
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        guard let shortcut = launchedShortcutItem else {
            return
        }
        handleShortCutItem(shortcut);
        launchedShortcutItem = nil
    }
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        launchedShortcutItem = launchOptions?[.shortcutItem] as? UIApplicationShortcutItem
        
        return true
    }
 
}

