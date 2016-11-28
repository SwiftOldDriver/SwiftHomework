//
//  ViewController.swift
//  Project 05 - CarouselEffect
//
//  Created by 陈铭嘉 on 2016/11/25.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    fileprivate var jokes = JokeFactory.createJokes()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: UIViewController / Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: UICollectionViewDataSource
extension MasterViewController:UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jokes.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:JokeCell.self), for: indexPath) as? JokeCell
            else {
                fatalError("unexpected cell in storyboard")
        }
        
        cell.joke = jokes[indexPath.item]
        return cell;
    }

}

