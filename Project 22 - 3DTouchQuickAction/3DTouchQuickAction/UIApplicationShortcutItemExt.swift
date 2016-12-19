//
//  UIApplicationShortcutItemExt.swift
//  3DTouchQuickAction
//
//  Created by nero on 2016/12/6.
//  Copyright © 2016年 nero. All rights reserved.
//
import UIKit



extension UIApplicationShortcutItem {
    
    enum ShortcutIdentifier: String {
        case first
        case second
        case third
        
        init?(itemFullType: String) {
            
            guard let last = itemFullType.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: last)
        }
        
    }
    
    @discardableResult
    func handleShortCutItem() -> Bool {
        guard let shortcutItem = ShortcutIdentifier(itemFullType: type)  else {
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
        UIApplication.shared.keyWindow?.rootViewController = vc
        
        return true
    }
    
}
