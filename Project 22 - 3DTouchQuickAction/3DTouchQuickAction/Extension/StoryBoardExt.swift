//
//  StoryBoardExt.swift
//  3DTouchQuickAction
//
//  Created by nero on 2016/12/6.
//  Copyright © 2016年 nero. All rights reserved.
//

import UIKit
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return "\(Self.self)"
    }
}

extension UIViewController : StoryboardIdentifiable { }

extension UIStoryboard {
    
    
    // 这里使用大写是为了和StoryBoardName 匹配
    enum Storyboard : String {
        case Main
    }
    
    
    /// Convenience Initializers
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    
    /// Class Functions
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
    
    

    
    
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}

