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

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let data = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 220
    }

    @IBAction func playVideoButtonDidTouch(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4") {
            let playViewController = AVPlayerViewController()
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            playViewController.player = player
            present(playViewController, animated: true) {
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
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.bind(video: data[indexPath.row])
        return cell
    }
}

