//
//  MenuTableViewController.swift
//  SlideMenu
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem = "Everyday Moments"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:MenuTableViewCell.self), for: indexPath) as? MenuTableViewCell
            else {
                fatalError("unexpected cell in storyboard")
        }
        
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? .white : .gray
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
    // MARK: - Storyboard Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        guard let menuTableViewController = segue.source as? MenuTableViewController else {
            return
        }
        if let selectedRow = menuTableViewController.tableView.indexPathForSelectedRow?.row {
            currentItem = menuItems[selectedRow]
        }
    }
}
