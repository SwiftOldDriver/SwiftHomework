//
//  MasterTableViewController.swift
//  SlideMenu
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    let menuTransitionManager = MenuTransitionManager()
    fileprivate var newsGroup = NewsFactory.createNews()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Everyday Moments"
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsGroup.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:MasterTableViewCell.self), for: indexPath) as? MasterTableViewCell
            else {
                fatalError("unexpected cell in storyboard")
        }
        
        cell.backgroundColor = .clear
        cell.news = newsGroup[indexPath.item]
        
        return cell
    }
    
    
    // MARK: - Storyboard Segue
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        if let sourceController = segue.source as? MenuTableViewController{
            title = sourceController.currentItem
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let menuTableViewController = segue.destination as? MenuTableViewController{
            menuTableViewController.currentItem = title!
            menuTableViewController.transitioningDelegate = menuTransitionManager
            menuTransitionManager.delegate = self
        }
    }
        
}

extension MasterTableViewController:MenuTransitionManagerDelegate {
    
    // MARK: - MenuTransitionManager Delegate
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
