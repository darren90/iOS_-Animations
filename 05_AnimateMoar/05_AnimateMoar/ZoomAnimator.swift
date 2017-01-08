//
//  ZoomAnimator.swift
//  05_AnimateMoar
//
//  Created by Tengfei on 2017/1/8.
//  Copyright © 2017年 tengfei. All rights reserved.
//

import UIKit

class ZoomAnimator: NSObject {
    // MARK:-- 定义一个属性，方便我们知道modar出来的界面是正在出现，还是正在消失
    var isPresented:Bool = false
}


extension ZoomAnimator : UIViewControllerTransitioningDelegate{
    // MARK:-- 以下的两个方法为必须要实现的，由于returen了self，所以我们的ZoomAnimator还需要实现UIViewControllerAnimatedTransitioning的协议方法
    
    // MARK:-- 弹出界面时调用的方法
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented  = true
        return self
    }
    // MARK:-- 消失界面时调用的方法
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}


extension ZoomAnimator : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        isPresented ? animateForPresentedView(using: transitionContext) : animateForDismissdView(using: transitionContext)
    }
    
    
    func animateForPresentedView(using transitionContext: UIViewControllerContextTransitioning){
        //1:取出弹出的view
        let prensentedView = transitionContext.view(forKey: .to)!

        //2.将prensentedView添加到containView中
        transitionContext.containerView.addSubview(prensentedView)
        //3,执行动画
        prensentedView.alpha = 0.0

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {() -> Void in
            prensentedView.alpha = 1.0
//            imageView.frame = presentedDelegate.endRect(indexPath: indexPath)
        }) {(_) -> Void in
        
            transitionContext.completeTransition(true)
        }
        
//        guard let presentedDelegate = presentedDelegate,let indexPath = indexPath else{
//            return
//        }
//        

//        ///获取执行动画的imageView
//        let startRect = presentedDelegate.startRect(indexPath: indexPath)
//        
//        let imageView = presentedDelegate.imageView(indexPath: indexPath)
//        imageView.frame = startRect
//        transitionContext.containerView.addSubview(imageView)
//        

    }
    
    func animateForDismissdView(using transitionContext: UIViewControllerContextTransitioning){
        //1:取出消失的view
        let dismissView = transitionContext.view(forKey: .from)!
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {() -> Void in
            dismissView .removeFromSuperview()
            dismissView.alpha = 0.0
//            imageView.frame = presentedDelegate.startRect(indexPath: indexPath)
        }) {(_) -> Void in
            transitionContext.completeTransition(true)
        }
        
        
//        guard let dismissDelegate = dismissDelegate,let presentedDelegate = presentedDelegate else{
//            return
//        }
//        

//        dismissView.removeFromSuperview()
//        //2.将prensentedView添加到containView中
//        //        transitionContext.containerView.addSubview(dismissView)
//        
//        let imageView = dismissDelegate.imageViewForDismiss()
//        transitionContext.containerView.addSubview(imageView)
//        let indexPath = dismissDelegate.indexPathForDismiss()
//        //3,执行动画
//        
//        

    }
    


}
