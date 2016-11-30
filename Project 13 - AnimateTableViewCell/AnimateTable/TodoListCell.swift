//
//  TodoListCell.swift
//  AnimateTable
//
//  Created by Jiar on 2016/11/29.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class TodoListCell: UITableViewCell {
    
    private let gradientLayer = CAGradientLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configGradientLayer()
        configTextLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func configGradientLayer() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(white: 1.0, alpha: 0.2).cgColor,
                                UIColor(white: 1.0, alpha: 0.1).cgColor,
                                UIColor.clear.cgColor,
                                UIColor(white: 0.0, alpha: 0.05).cgColor]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func configTextLabel() {
        textLabel?.textColor = .white
        textLabel?.backgroundColor = .clear
        textLabel?.font = UIFont.systemFont(ofSize: 18)
    }

}
