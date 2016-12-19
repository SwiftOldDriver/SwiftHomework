//
//  ViewController.swift
//  Snapchat Menu
//
//  Created by Jiar on 2016/11/24.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var cameraViewController: CameraViewController!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configScrollView()
    }
    
    private func configScrollView() {
        let leftViewController: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        cameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightViewController: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        addChildViewController(leftViewController)
        scrollView.addSubview(leftViewController.view)
        leftViewController.didMove(toParentViewController: self)
        addChildViewController(cameraViewController)
        scrollView.addSubview(cameraViewController.view)
        cameraViewController.didMove(toParentViewController: self)
        addChildViewController(rightViewController)
        scrollView.addSubview(rightViewController.view)
        rightViewController.didMove(toParentViewController: self)
        
        var itemFrame: CGRect = view.frame
        leftViewController.view.frame = itemFrame
        itemFrame.origin.x = view.frame.width
        cameraViewController.view.frame = itemFrame
        itemFrame.origin.x = 2 * view.frame.width
        rightViewController.view.frame = itemFrame
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let cameraViewShowing = offsetX > 0 && offsetX < view.frame.width * 2
        if cameraViewShowing != cameraViewController.showing {
            cameraViewController.showing = cameraViewShowing
        }
    }

}
