//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by Jiar on 2016/12/5.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var backBtn: UIButton!

    var backBtnTapped: (() -> Void)?
    
    func cellSelectedHandle() {
        backBtn.isHidden = false
        superview?.bringSubview(toFront: self)
    }

    @IBAction func backAction(_ sender: Any) {
        backBtnTapped?()
    }
    
}
