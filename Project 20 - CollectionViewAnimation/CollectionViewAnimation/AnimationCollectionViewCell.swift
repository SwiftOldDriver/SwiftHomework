//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by Jiar on 2016/12/5.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var contentImageView: UIImageView!
    @IBOutlet weak private var contentTextView: UITextView!
    @IBOutlet weak private var backBtn: UIButton!

    var backBtnTapped: (() -> Void)?
    
    func bind(model: AnimationModel) {
        backBtn.isHidden = true
        contentImageView.image = UIImage(named: model.imagePath)
        contentTextView.isScrollEnabled = false
    }
    
    func cellSelectedHandle() {
        backBtn.isHidden = false
        superview?.bringSubview(toFront: self)
    }

    @IBAction func backAction(_ sender: Any) {
        backBtnTapped?()
    }
    
}
