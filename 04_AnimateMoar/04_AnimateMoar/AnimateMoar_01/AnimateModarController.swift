//
//  AnimateModarController.swift
//  04_AnimateMoar
//
//  Created by Tengfei on 2016/12/7.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

class AnimateModarController: UIPresentationController {
    
    var presentedFrame : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    //重写方法，设置弹出view的大小，位置
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        //设置弹出view的尺寸
        presentedView?.frame = presentedFrame
        
        //添加蒙版
        
        setUpCoverView()
    }
    
    override func containerViewDidLayoutSubviews() {
        
    }
    
    private lazy var coverView:UIView = UIView()
    
    func setUpCoverView()  {
        //        containerView?.addSubview(coverView)
        containerView?.insertSubview(coverView, at: 0)
        
        //设置蒙版属性
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        coverView.frame = containerView!.bounds
        
        //添加手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.remove))
        coverView.addGestureRecognizer(tap)
    }
    
    func remove() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }

}
