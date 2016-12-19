//
//  LaunchView.swift
//  AnimatedSplash
//
//  Created by PixelShi on 2016/12/10.
//  Copyright © 2016年 shifengming. All rights reserved.
//

import UIKit

class LaunchView: UIImageView, CAAnimationDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "twitterscreen")
        let imageMask = CALayer()
        initalizeMask(mask: imageMask)
    }

    private func initalizeMask(mask: CALayer) {
        mask.contents = UIImage(named: "twitter")?.cgImage
        mask.contentsGravity = kCAGravityResizeAspect
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        mask.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.layer.mask = mask
        animateMask(mask: mask)
    }

    private func animateMask(mask: CALayer) {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        ]
        let initalBounds = NSValue(cgRect: mask.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        mask.add(keyFrameAnimation, forKey: "bounds")
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag == true {
            self.layer.mask = nil
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
