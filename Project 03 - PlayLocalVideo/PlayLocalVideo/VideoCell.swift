//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by PixelShi on 2016/11/25.
//  Copyright © 2016年 shifengming. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!

    public func bind(video: Video) {
        videoScreenshot.image = UIImage(named: video.image)
        videoTitleLabel.text = video.title
        videoSourceLabel.text = video.source
    }
}
