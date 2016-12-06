//
//  TableViewController.swift
//  TumblrMenu
//
//  Created by Mee Leo on 11/29/16.
//  Copyright © 2016 Mee Leo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
    }
    
    private func setupTabBarItem() {
        let postImage = UIImage(imageLiteralResourceName: "newPost").withRenderingMode(.alwaysOriginal)
        tabBarItem = UITabBarItem(title: nil, image: postImage, selectedImage: nil)
        tabBarController?.delegate = self
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier1", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 207
        }else {
            return 321
        }
    }
    
    // MARK: - TabbarController Delegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let menuController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController"){
            menuController.transitioningDelegate = TransitionManager()
            viewController.present(menuController, animated: true, completion: nil)
        }
    }
    
}
