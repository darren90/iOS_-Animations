//
//  ViewController.swift
//  DotAnimation
//
//  Created by Tengfei on 2016/11/30.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //消息循环，添加到主线程
    //extern NSString* const NSDefaultRunLoopMode;  //默认没有优先级
    //extern NSString* const NSRunLoopCommonModes;  //提高优先级
    lazy var timer:Timer = {
       let timerr = Timer(timeInterval: 2.0, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
        return timerr
    }()
    
    let dotView : DotView = DotView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(dotView)
        dotView.frame = view.bounds
        
        RunLoop.main.add(timer, forMode: .commonModes)
        
        view.backgroundColor = UIColor.white
        
    }
    
    func timerAction() {
//        dotView.progress = dotView.progress + 1
    }

    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

