//
//  TodoListCell.swift
//  ClearTableViewCell
//
//  Created by Damon on 2016/11/28.
//  Copyright © 2016年 swiftdrive. All rights reserved.
//

import UIKit

class TodoListCell: UITableViewCell {

	private let gradientLayer = CAGradientLayer()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configGradientLayer()
		configtextLabel()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		gradientLayer.frame = self.bounds
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configGradientLayer(){
		gradientLayer.frame = self.bounds
		gradientLayer.colors = [UIColor(white: 1.0, alpha: 0.2).cgColor,
		                        UIColor(white: 1.0, alpha: 0.1).cgColor,
		                        UIColor.clear.cgColor,
		                        UIColor(white: 0.0, alpha: 0.05).cgColor]
		gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
		layer.insertSublayer(gradientLayer, at: 0)
	}
	
	private func configtextLabel(){
		textLabel?.textColor = .white
		textLabel?.backgroundColor = .clear
		textLabel?.font = UIFont(name: "Avenir Next", size: 18)
		selectionStyle = .none
	}
}
