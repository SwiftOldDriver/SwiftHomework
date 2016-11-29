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
    
    private var newsGroup = [
        NewsItem(title: "Love mountain.", author: "Allen Wang", authorImage: UIImage(named: "a")!, coverImage: UIImage(named: "1")!),
        NewsItem(title: "New graphic design - LIVE FREE", author: "Cole", authorImage: UIImage(named: "b")!, coverImage: UIImage(named: "2")!),
        NewsItem(title: "Summer sand", author: "Daniel Hooper", authorImage: UIImage(named: "c")!, coverImage: UIImage(named: "3")!),
        NewsItem(title: "Seeking for signal", author: "Noby-Wan Kenobi", authorImage: UIImage(named: "d")!, coverImage: UIImage(named: "4")!),
        ]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTransitionManager.delegate = self
        title = "Everyday Moments"
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        
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
        let news = newsGroup[indexPath.item]
        cell.backgroundColor = .clear
        cell.bind(news: news)

        return cell
    }
    
    // MARK: - Storyboard Segue
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        if let sourceController = segue.source as? MenuTableViewController {
            title = sourceController.currentItem
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let menuTableViewController = segue.destination as? MenuTableViewController {
            menuTableViewController.currentItem = title!
            menuTableViewController.transitioningDelegate = menuTransitionManager
        }
    }
}

extension MasterTableViewController:MenuTransitionManagerDelegate {
    
    // MARK: - MenuTransitionManager Delegate
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
