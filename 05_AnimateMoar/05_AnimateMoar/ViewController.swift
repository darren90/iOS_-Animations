//
//  ViewController.swift
//  05_AnimateMoar
//
//  Created by Tengfei on 2017/1/8.
//  Copyright © 2017年 tengfei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var zoomAnimator : ZoomAnimator = ZoomAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "home")
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let w = (collectionView.frame.size.width - 3*10)/2
        layout.itemSize = CGSize(width: w, height: 150)
        collectionView.alwaysBounceVertical  = true
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
    }
 }


extension ViewController : UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home", for: indexPath) as! HomeCell
        let KRandomColor =  UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
        cell.backgroundColor = KRandomColor
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = ZoomDetailController()
        let nav = UINavigationController(rootViewController: detailVc)
        nav.modalPresentationStyle = .custom
        nav.transitioningDelegate = zoomAnimator
        navigationController?.present(nav, animated: true, completion: nil)
    }
    
    
}


class HomeCell:UICollectionViewCell {
    
    
}
