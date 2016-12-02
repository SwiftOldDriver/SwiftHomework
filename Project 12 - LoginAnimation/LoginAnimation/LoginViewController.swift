//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by TimberTang on 16/12/1.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    @IBOutlet weak var centerAlignLoginButton: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareAnimateion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performAnimation()
    }
    
    private func prepareAnimateion() {
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        centerAlignLoginButton.constant -= view.bounds.width
        loginButton.alpha = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
    
    private func performAnimation() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.00,
                       options: .curveEaseOut,
                       animations: {
                        self.centerAlignUsername.constant += self.view.bounds.width
                        self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.10,
                       options: .curveEaseOut,
                       animations: {
                        self.centerAlignPassword.constant += self.view.bounds.width
                        self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.20,
                       options: .curveEaseOut,
                       animations: {
                        self.loginButton.alpha = 1
                        self.centerAlignLoginButton.constant += self.view.bounds.width
                        self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    @IBAction func loginButtonDidTouch(sender: UIButton) {
        endEditing()
        let bounds = loginButton.bounds
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: {
                        self.loginButton.bounds = CGRect(x: bounds.origin.x - 30, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                        self.loginButton.isEnabled = false
            }, completion: { finished in
                if finished {
                    self.loginButton.isEnabled = true
                    self.loginButton.bounds = bounds
                }
        })
    }
    
    @IBAction func backButtonDidTouch(sender: AnyObject) {
        endEditing()
        dismiss(animated: true, completion: nil)
    }
    
    private func endEditing() {
        view.endEditing(true)
    }
    
}
