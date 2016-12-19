
//
//  SplashViewController.swift
//  LoginAnimation
//
//  Created by TimberTang on 16/12/1.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
}
