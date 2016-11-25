//
//  JokeItem.swift
//  CarouselEffect
//
//  Created by 陈铭嘉 on 2016/11/25.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class JokeItem {

    var title = ""
    var content = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage?
    
    init(title: String, content: String, featuredImage: UIImage!) {
        self.title = title
        self.content = content
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
}


class JokeFactory {

    static func createJokes()->[JokeItem]?{
        return [
            JokeItem(title: "Hello there, i miss u.", content: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            JokeItem(title: "🐳🐳🐳🐳🐳", content: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            JokeItem(title: "Training like this, #bodyline", content: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            JokeItem(title: "I'm hungry, indeed.", content: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            JokeItem(title: "Dark Varder, #emoji", content: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            JokeItem(title: "I have no idea, bitch", content: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }
    
}
