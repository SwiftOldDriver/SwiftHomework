//
//  ViewController.swift
//  ClearTableViewCell
//
//  Created by Damon on 2016/11/28.
//  Copyright © 2016年 swiftdrive. All rights reserved.
//  需要在 info.plist 设置 View controller-based status bar appearance 为 NO 才能使 UIApplication.shared.isStatusBarHidden = true 有效。

import UIKit

class TodoListController: UITableViewController {
	
	// MARK: - variable
	fileprivate let todos = ["Read 3 article on Medium",
	                         "Cleanup bedroom",
	                         "Go for a run",
	                         "Hit the gym",
	                         "Build another swift project",
	                         "Movement training",
	                         "Fix the layout problem of a client project",
	                         "Write the experience of #30daysSwift",
	                         "Inbox Zero",
	                         "Booking the ticket to Chengdu",
	                         "Test the Adobe Project Comet",
	                         "Hop on a call to mom"]
	
	fileprivate let todoListCellID = "TodoListCell"

	// MARK: - life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		UIApplication.shared.isStatusBarHidden = true
		configTableView()
	}
	
	private func configTableView(){
		tableView.backgroundColor = .black
		tableView.separatorStyle = .none
		tableView.register(TodoListCell.self, forCellReuseIdentifier: todoListCellID)
		tableView.rowHeight = 60
	}
	
	// MARK: - private variable
	fileprivate func color(at index: Int) -> UIColor {
		let color = (CGFloat(index) / CGFloat(todos.count - 1)) * 0.6
		return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
	}
}

// MARK: - UITableViewDelegate,UITableViewDataSource

extension TodoListController {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return todos.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: todoListCellID, for: indexPath)
		cell.textLabel?.text = todos[indexPath.row]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.backgroundColor =  color(at: indexPath.row)
	}
}
