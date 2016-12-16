//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by Jiar on 2016/11/29.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    private let CellIdentifier = "AnimationCollectionViewCell"
    private let NibName = "AnimationCollectionViewCell"
    private let animations = AnimationModelCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib.init(nibName: NibName, bundle: nil), forCellWithReuseIdentifier: CellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as? AnimationCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(model: animations[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
            return
        }
        cell.cellSelectedHandle()
        cell.backBtnTapped = {
            guard let indexPaths = collectionView.indexPathsForSelectedItems else {
                return
            }
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: indexPaths)
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            cell.frame = collectionView.bounds
        }, completion: { _ in
            collectionView.isScrollEnabled = false
        })
    }

}

extension AnimationCollectionViewCell {
    
    func bind(model: AnimationModel) {
        backBtn.isHidden = true
        contentImageView.image = UIImage(named: model.imagePath)
        contentTextView.isScrollEnabled = false
    }
    
}
