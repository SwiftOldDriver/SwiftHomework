//
//  ViewController.swift
//  ImageScroller
//
//  Created by Yasin on 2016/11/28.
//  Copyright © 2016年 Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         storyboard里面Visual Effect View结合最底层imageview做到图片模糊背景，Visual Effect View设置了blur style
         设置scrollView.minimumZoomScale = 1,scrollView.maximumZoomScale = 3
         设置约束
         设置scrollView代理
         
         最终实现imageView在屏幕中心位置放大缩小
         */
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //只有 scrollview的delegate复写了viewForZoomingInScrollView scrollview才会缩放。
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
    }
    
    func recenterImage() {
        //重新设置scrollView的中心点
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
}

