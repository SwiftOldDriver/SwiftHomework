//
//  AnimationModelCollection.swift
//  CollectionViewAnimation
//
//  Created by Jiar on 2016/12/5.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import Foundation

struct AnimationModelCollection {
    
    private let imagePaths = ["1", "2", "3", "4", "5"]
    private let models: [AnimationModel]
    
    var count: Int {
        return models.count
    }
    
    init() {
        models = imagePaths.map {
            AnimationModel(imagePath: $0)
        }
    }
    
    subscript(input: Int) -> AnimationModel {
        if input > count {
            return models[input % count]
        }
        return models[input]
    }
    
}
