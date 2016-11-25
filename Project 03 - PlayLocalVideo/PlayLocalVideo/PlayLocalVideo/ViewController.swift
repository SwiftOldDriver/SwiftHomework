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

private struct Handle {
    static let kVideoCellHeight: CGFloat = 220
    static let videoData = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    static let videoPlayPath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
}

class ViewController: UIViewController {

    @IBOutlet weak var videoTabelView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playVideoButtonDidTouch(_ sender: Any) {
        let playViewController = AVPlayerViewController()
        let playerView = AVPlayer(url: URL(fileURLWithPath: Handle.videoPlayPath!))
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            playViewController.player?.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

private typealias Delegate = ViewController
extension Delegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Handle.kVideoCellHeight
    }
}

private typealias DataSource = ViewController
extension DataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Handle.videoData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTabelView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.bindData(with: Handle.videoData[indexPath.row])
        return cell
    }

}

