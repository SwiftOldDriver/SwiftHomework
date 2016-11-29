//
//  NewsItem.swift
//  SlideMenu
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class NewsItem {
    
    var title = ""
    var author = ""
    var authorImage: UIImage?
    var coverImage: UIImage?
    
    init(title: String, author: String, authorImage: UIImage,coverImage: UIImage) {
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.authorImage = authorImage
    }
}
