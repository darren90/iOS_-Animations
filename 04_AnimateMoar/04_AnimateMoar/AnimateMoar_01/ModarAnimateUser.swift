//
//  ModarAnimateUser.swift
//  04_AnimateMoar
//
//  Created by Tengfei on 2016/12/7.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

class ModarAnimateUser: NSObject {
    var isPresendted = false
    var presentedFrame : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
}


// MARK:-- 自定义转场代理
extension ModarAnimateUser : UIViewControllerTransitioningDelegate{
    // MARK:-- 改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = AnimateModarController(presentedViewController: presented, presenting : presenting)
        presentation.presentedFrame = presentedFrame
        return presentation
    }
    
    // MARK:-- 自定义弹出的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresendted = true
        return self
    }
    
    // MARK:-- 自定义消失的动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresendted = false
        return self
    }
    
}

// MARK:-- 弹出和消失的动画 的 代理 的反复
extension ModarAnimateUser:UIViewControllerAnimatedTransitioning {
    
    //动画执行的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    
    //获取转场的上下文 ：可以通过转场，获取弹出的view和消失的view
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresendted ? animateionForPresendView(transitionContext: transitionContext) : animateionForDismiss(transitionContext: transitionContext)
    }
    
    // MARK:-- 自定义弹出动画
    
    private func animateionForPresendView(transitionContext: UIViewControllerContextTransitioning){
        //获取弹出的view
        //UITransitionContextFromViewKey
        //UITransitionContextToViewKey
        let presentedView2 = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        guard let presentedView = presentedView2 else {
            return
        }
        
        //2：将弹出的view添加到containView中
        transitionContext.containerView.addSubview(presentedView)
        
        //3：执行动画
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)//设置动画的锚点
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (isFininshed:Bool) in
            //必须告诉上下文，我们的自定义动画，已经完成
            transitionContext.completeTransition(true)
        }
    }
    
    // MARK:-- 自定义消失动画
    
    private func animateionForDismiss(transitionContext: UIViewControllerContextTransitioning){
        //获取弹出的view
        //UITransitionContextFromViewKey
        //UITransitionContextToViewKey
        let dismissView2 = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        guard let dismissView = dismissView2 else {
            return
        }
        
        //2：将弹出的view添加到containView中
        transitionContext.containerView.addSubview(dismissView)
        
        //3：执行动画
        //        dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        dismissView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)//设置动画的锚点
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.01)
        }) { (isFininshed:Bool) in
            dismissView.removeFromSuperview()
            //必须告诉上下文，我们的自定义动画，已经完成
            transitionContext.completeTransition(true)
        }
    }
    
}
