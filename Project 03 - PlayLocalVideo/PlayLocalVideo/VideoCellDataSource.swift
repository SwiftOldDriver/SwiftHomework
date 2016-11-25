//
//  VideoCellDataSource.swift
//  PlayLocalVideo
//
//  Created by Jerry on 25/11/2016.
//  Copyright © 2016 shifengming. All rights reserved.
//

import UIKit

struct VideoCellDataSource {
    var cellHeight: CGFloat
    var videoCellModel: VideoModel
    
    static var cellModels: [VideoModel] {
        get {
            return [
                VideoModel(videoScreenShotImageName: "videoScreenshot01", videoTitle: "Introduce 3DS Mario", videoSourceSubTitle: "Youtube - 06:32"),
                VideoModel(videoScreenShotImageName: "videoScreenshot02", videoTitle: "Emoji Among Us", videoSourceSubTitle: "Vimeo - 3:34"),
                VideoModel(videoScreenShotImageName: "videoScreenshot03", videoTitle: "Seals Documentary", videoSourceSubTitle: "Vine - 00:06"),
                VideoModel(videoScreenShotImageName: "videoScreenshot04", videoTitle: "Adventure Time", videoSourceSubTitle: "Youtube - 02:39"),
                VideoModel(videoScreenShotImageName: "videoScreenshot05", videoTitle: "Facebook HQ", videoSourceSubTitle: "Facebook - 10:20"),
                VideoModel(videoScreenShotImageName: "videoScreenshot06", videoTitle: "Lijiang Lugu Lake", videoSourceSubTitle: "Allen - 20:30")
            ]
        }
    }
    
    static func constructDataSource() -> [VideoCellDataSource] {
        return self.cellModels.map({ (cellModel) -> VideoCellDataSource in
            return VideoCellDataSource(cellHeight: 220, videoCellModel: cellModel)
        })
    }
}
