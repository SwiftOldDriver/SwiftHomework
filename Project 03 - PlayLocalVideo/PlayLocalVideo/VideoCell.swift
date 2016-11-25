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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func bindDataSource(with dataSource: VideoCellDataSource) {
        let videoModel = dataSource.videoCellModel
        videoScreenshot.image = UIImage(named: videoModel.videoScreenShotImageName)
        videoTitleLabel.text = videoModel.videoTitle
        videoSourceLabel.text = videoModel.videoSourceSubTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
