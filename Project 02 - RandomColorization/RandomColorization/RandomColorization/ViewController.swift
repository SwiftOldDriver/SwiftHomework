//
//  ViewController.swift
//  RandomColorization
//
//  Created by daemon on 2016/11/27.
//  Copyright © 2016年 daemon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var timer: Timer?
    private lazy var audioPlayer: AVAudioPlayer = {
        var player = AVAudioPlayer()
        let musicURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try player = AVAudioPlayer(contentsOf: musicURL)
            
        } catch let audioErr as NSError {
            print(audioErr)
        }
        
        return player
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let color1 = UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3).cgColor
        let color5 = UIColor(red: 0.0, green: 0.0, blue: 0.5, alpha: 0.2).cgColor
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [color1, color2, color3, color4, color5]
        layer.locations = [0.1, 0.3, 0.5, 0.7, 0.9]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        return layer
    }()
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            guard let timer = timer else {
                fatalError()
            }
            timer.invalidate()
            audioPlayer.pause()
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.2,
                                         target: self,
                                         selector: #selector(self.changeBackgroundColor),
                                         userInfo: nil,
                                         repeats: true)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradientLayer)
    }
    
    @objc private func changeBackgroundColor() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}

