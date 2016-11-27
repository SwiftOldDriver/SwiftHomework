//
//  ViewController.swift
//  Snapchat Menu
//
//  Created by Jiar on 2016/11/24.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configScrollView()
    }
    
    private func configScrollView() {
        let leftViewController: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let cameraViewController: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
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
    }

}
