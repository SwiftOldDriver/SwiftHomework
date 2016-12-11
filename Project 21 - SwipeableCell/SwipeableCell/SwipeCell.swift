//
//  PatternCell.swift
//  SwipeableCell
//
//  Created by TimberTang on 16/12/11.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit


class SwipeCell: UITableViewCell {
    
    @IBOutlet weak var patternImageView: UIImageView!
    @IBOutlet weak var patternNameLabel: UILabel!
    
    func bind(with pattern: Pattern) {
        patternNameLabel.text = pattern.name
        if let image = UIImage(named: pattern.imageName)  {
            patternImageView.image = image
        }
    }
    
}

