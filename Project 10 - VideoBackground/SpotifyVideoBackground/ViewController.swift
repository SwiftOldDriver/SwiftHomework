//
//  ViewController.swift
//  SpotifyVideoBackground
//
//  Created by Jiar on 2016/11/28.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var signupBtn: UIButton!
    private var player: AVPlayer!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBtn()
        configPlayer()
    }
    
    private func configBtn() {
        loginBtn.layer.cornerRadius = 4
        signupBtn.layer.cornerRadius = 4
    }
    
    private func configPlayer() {
        guard let path = Bundle.main.path(forResource: "moments", ofType: "mp4") else {
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.repeatDuration = playerLayer.duration
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = view.frame
        /**
         * 注意
         * 这里使用了 insertSublayer(_ at:) 方法，而不是使用 addSublayer(_ )
         * 使用 addSublayer(_ ) 会导致视频界面遮盖 Main.storyboard 中设置的注册和登录按钮
         * 使用 insertSublayer(_ at:) 直接将 layer 插入位置 0 ，即最下方，不会遮挡按钮
         */
        view.layer.insertSublayer(playerLayer, at: 0)
        player.play()
        NotificationCenter.default.addObserver(self, selector: #selector(repeatToPlay), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }

    func repeatToPlay() {
        player.seek(to: CMTimeMake(0, 1))
        player.play()
    }
    
}
