//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by Mee Leo on 12/5/16.
//  Copyright © 2016 Mee Leo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    let tansitionDelegate = TransitionManager()
    @IBOutlet var leftButtons: [UIButton]!
    @IBOutlet var rightButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = tansitionDelegate
    }
    
    @IBAction func dismissSelf(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
