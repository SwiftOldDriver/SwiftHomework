//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Mee Leo on 11/25/16.
//  Copyright © 2016 Mee Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    let reuseIdentifier = "reuseIdentifier"
    var emojiData = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pull To Refresh"
        setupTableView()
        setupRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.frame = view.frame
    }
    
    // MARK: - Setup

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        emojiData.append(contentsOf: randomEmojiData())
        view.addSubview(tableView)
    }

    private func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(ViewController.refreshTableView), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: [:])
    }

    // MARK: - Private Function
    
    // get a random emoji array , whitch has 5 elements
    private func randomEmojiData() -> [String] {
        let emojis = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷"]
        let emojiCount = emojis.count
        var randomEmoji = [String]()
        for _ in 1...5 {
            let randomInt = Int(arc4random()) % emojiCount
            let emoji = emojis[randomInt]
            randomEmoji.append("\(emoji) \(emoji) \(emoji) \(emoji) \(emoji)")
        }
        return randomEmoji
    }
    
    // MARK: - UITableViewDataSource
    internal func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ _: UITableView, numberOfRowsInSection _: Int) -> Int {
        return emojiData.count
    }
    
    internal func tableView(_ _: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = emojiData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 40)
        cell.textLabel?.textAlignment = .center
        return cell
    }

    
    // MARK: - UITableViewDelegate
    
    func tableView(_ _: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 60
    }
    
    
    // MARK: - RefreshControl
    
    func refreshTableView() {
        emojiData.insert(contentsOf: randomEmojiData(), at: 0)
        tableView.reloadSections(IndexSet(arrayLiteral:0), with: .automatic)
        refreshControl.endRefreshing()
    }
}

