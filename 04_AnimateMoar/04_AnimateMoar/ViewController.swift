//
//  ViewController.swift
//  04_AnimateMoar
//
//  Created by Tengfei on 2016/12/7.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var modarAnimation = ModarAnimateUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sysModarAction() {
        let modarVc = Modar01ViewController()
        present(modarVc, animated: true, completion: nil)
    }
 
    @IBAction func animationModarAction() {
        //自定义专场
        let modarVc = Modar01ViewController()
        
        //设置modar样式
        //设置为custom样式，底下的控制器，就不被移除，正常情况下，底下的控制器，会被移除
        modarVc.modalPresentationStyle = .custom
        
        //自定义转场动画
        
        //设置转场代理
        modarVc.transitioningDelegate = modarAnimation;
        //封装后，设置弹出view的frame
        modarAnimation.presentedFrame = CGRect(x: 100, y: 60, width: 180, height: 250)
        
        present(modarVc, animated: true, completion: nil)
    }

}











