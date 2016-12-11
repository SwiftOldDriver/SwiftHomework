
//
//  ViewControllerTableViewController.swift
//  SwipeableCell
//
//  Created by TimberTang on 16/12/11.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit

private let SwipeCellIdentifier = "SwipeCellIdentifier"

class ViewController: UITableViewController {
    
    private var dataSource = [Pattern]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        title = "SwipeableCell"
        configDataSource()
    }
    
    private func configDataSource() {
        dataSource = [
            Pattern(imageName: "image_1", name: "Pattern Building"),
            Pattern(imageName: "image_2", name: "Joe Beez"),
            Pattern(imageName: "image_3", name: "Car It's car"),
            Pattern(imageName: "image_4", name: "Floral Kaleidoscopic"),
            Pattern(imageName: "image_5", name: "Sprinkle Pattern"),
            Pattern(imageName: "image_6", name: "Palitos de queso"),
            Pattern(imageName: "image_7", name: "Ready to Go? Pattern"),
            Pattern(imageName: "image_8", name: "Sets Seamless"),
        ]
    }
    
    private func dispalyShare(with item: Pattern) {
        let activityViewController = UIActivityViewController(activityItems: [item.imageName as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwipeCellIdentifier, for: indexPath) as! SwipeCell
        let pattern = dataSource[indexPath.row]
        cell.displayCell(with: pattern)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (rowAction, indexPath) in
            let item = self.dataSource[indexPath.row]
            self.dispalyShare(with: item)
        }
        share.backgroundColor = .red
        
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = .blue
        
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { action, index in
            print("Delete button tapped")
        }
        delete.backgroundColor = .gray
        
        return [download, share, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}
