//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by Jiar on 2016/11/29.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    private struct Storyboard {
        static let CellIdentifier = "AnimationCollectionViewCell"
        static let NibName = "AnimationCollectionViewCell"
    }
    
    private let animationModelCollection = AnimationModelCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib.init(nibName: Storyboard.NibName, bundle: nil), forCellWithReuseIdentifier: Storyboard.CellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as? AnimationCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(model: animationModelCollection[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animationModelCollection.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
            return
        }
        cellSelectedHandle(collectionView, cell: cell)
    }
    
    private func cellSelectedHandle(_ collectionView: UICollectionView, cell: AnimationCollectionViewCell) {
        cell.cellSelectedHandle()
        cell.backBtnTapped = {
            () -> Void in
            guard let indexPaths = collectionView.indexPathsForSelectedItems else {
                return
            }
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: indexPaths)
        }
        let animations: () -> Void = {
            cell.frame = collectionView.bounds
        }
        let completion: (Bool) -> Void = { _ in
            collectionView.isScrollEnabled = false
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: animations, completion: completion)
    }

}
