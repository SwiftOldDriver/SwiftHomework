//
//  PuzzlePiece.swift
//  Artificial
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class PuzzlePiece: UIButton {
    
/// 本方块在原图上的位置，从0开始编号
    var id: Int?
    
    static func piece(WithId id: Int,image: UIImage) -> PuzzlePiece {
        let piece = PuzzlePiece()
        piece.id = id
        piece.layer.borderWidth = 1
        piece.layer.borderColor = UIColor.white.cgColor
        piece.setBackgroundImage(image, for: .normal)
        return piece
    }
}
