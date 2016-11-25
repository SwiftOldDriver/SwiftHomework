//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by PixelShi on 2016/11/25.
//  Copyright © 2016年 shifengming. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

private struct Constant {
    static let videoPath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var videoDataSource = [VideoCellDataSource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoDataSource = VideoCellDataSource.constructDataSource()
    }

    @IBAction func playVideoButtonDidTouch(_ sender: Any) {
        if let path = Constant.videoPath, let url = URL(string: path) {
            let playViewController = AVPlayerViewController()
            let playerView = AVPlayer(url: url)
            playViewController.player = playerView
            self.present(playViewController, animated: true) {
                playViewController.player?.play()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videoDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let dataSource = self.videoDataSource[indexPath.row]
        cell.bindDataSource(with: dataSource)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataSource = self.videoDataSource[indexPath.row]
        return dataSource.cellHeight
    }
}

