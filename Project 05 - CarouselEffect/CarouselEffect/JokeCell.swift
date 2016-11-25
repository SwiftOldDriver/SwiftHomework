//
//  JokeCell.swift
//  CarouselEffect
//
//  Created by 陈铭嘉 on 2016/11/25.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

// Cell class for collection view
class JokeCell: UICollectionViewCell {
       
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var jokeTitleLabel: UILabel!
    
    var joke : JokeItem? {
        didSet {
            if let _ = joke{  updateUI()  }
        }
    }
    
    //Update only if the joke is available
    fileprivate func updateUI(){
        featuredImageView.image = joke?.featuredImage
        jokeTitleLabel.text = joke?.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
}
