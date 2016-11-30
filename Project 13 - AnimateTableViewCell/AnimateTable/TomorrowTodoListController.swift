//
//  TomorrowTodoListController.swift
//  AnimateTable
//
//  Created by Jiar on 2016/11/29.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class TomorrowTodoListController: UITableViewController {

    // MARK: - Private Variable Or Constant
    
    private let todos = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    // MARK: - Override Variable Or Function
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableCells()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = color(forIndex: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Private Function
    
    private func animateTableCells() {
        tableView.reloadData()
        let visibleCells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.frame.size.height
        for cell in visibleCells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        for (index, cell) in visibleCells.enumerated() {
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
    
    private func color(forIndex index: Int) -> UIColor {
        let itemCount = todos.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }

}
