
//
//  ViewControllerTableViewController.swift
//  SwipeableCell
//
//  Created by TimberTang on 16/12/11.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    private let SwipeCellIdentifier = "SwipeCellIdentifier"
    private var patterns = [Pattern]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        title = "SwipeableCell"
        configDataSource()
    }
    
    private func configDataSource() {
        patterns = [
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
    
    private func displayDelete(with indexPath: IndexPath) {
        patterns.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    private func displayDownload(with indexPath: IndexPath) {
        let downloadAlert = UIAlertController(title: "", message: "Download?", preferredStyle: .alert)
        downloadAlert.addAction(UIAlertAction(title: "取消", style: .cancel))
        downloadAlert.addAction(UIAlertAction(title: "确定", style: .default))
        present(downloadAlert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwipeCellIdentifier, for: indexPath) as! SwipeCell
        let pattern = patterns[indexPath.row]
        bind(cell: cell, with: pattern)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { [weak self] (rowAction, indexPath) in
            if let `self` = self {
                let item = self.patterns[indexPath.row]
                self.dispalyShare(with: item)
            }
        }
        share.backgroundColor = .red
        
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { [weak self] action, index in
            if let `self` = self {
                self.displayDownload(with: index)
            }
        }
        download.backgroundColor = .blue
        
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { [weak self] action, index in
            if let `self` = self {
                self.displayDelete(with: index)
            }
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

fileprivate extension ViewController {
    
    func bind(cell: SwipeCell, with pattern: Pattern) {
        cell.patternNameLabel.text = pattern.name
        if let image = UIImage(named: pattern.imageName)  {
            cell.patternImageView.image = image
        }
    }
    
}

