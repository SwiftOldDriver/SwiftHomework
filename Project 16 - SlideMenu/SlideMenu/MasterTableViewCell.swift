//
//  MasrerTableViewCell.swift
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


class NewsFactory {
    
    static func createNews() -> [NewsItem] {
        return [
            NewsItem(title: "Love mountain.", author: "Allen Wang", authorImage: UIImage(named: "a")!, coverImage: UIImage(named: "1")!),
            NewsItem(title: "New graphic design - LIVE FREE", author: "Cole", authorImage: UIImage(named: "b")!, coverImage: UIImage(named: "2")!),
            NewsItem(title: "Summer sand", author: "Daniel Hooper", authorImage: UIImage(named: "c")!, coverImage: UIImage(named: "3")!),
            NewsItem(title: "Seeking for signal", author: "Noby-Wan Kenobi", authorImage: UIImage(named: "d")!, coverImage: UIImage(named: "4")!),
        ]
    }
    
}




class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var news : NewsItem? {
        didSet {
            if let _ = news {
                updateUI()
            }
        }
    }
    
    //Update only if the news is available
    fileprivate func updateUI() {
        avatarImageView.image = news?.authorImage
        coverImageView.image = news?.coverImage
        titleLabel.text = news?.title
        authorLabel.text = news?.author
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
