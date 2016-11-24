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
        
        let leftView: LeftView = LeftView(nibName: "LeftView", bundle: nil)
        let centerView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        
        addChildViewController(leftView)
        scrollView.addSubview(leftView.view)
//        leftView.didMove(toParentViewController: self)
        
        addChildViewController(rightView)
        scrollView.addSubview(rightView.view)
//        rightView.didMove(toParentViewController: self)
        
        addChildViewController(centerView)
        scrollView.addSubview(centerView.view)
//        centerView.didMove(toParentViewController: self)
        
        var itemFrame: CGRect = view.frame
        leftView.view.frame = itemFrame
        itemFrame.origin.x = view.frame.width
        centerView.view.frame = itemFrame
        itemFrame.origin.x = 2 * view.frame.width
        rightView.view.frame = itemFrame
        
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.size.height)
        
    }

}

