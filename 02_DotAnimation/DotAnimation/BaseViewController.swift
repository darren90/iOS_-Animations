//
//  ViewController.swift
//  DotAnimation
//
//  Created by Tengfei on 2016/11/30.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

enum ErrorNetType:Int {
    case Default  //默认错误
    case NoNet  //  无网络
    case ServerError// 服务器错误
}

class BaseViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    //消息循环，添加到主线程
    //extern NSString* const NSDefaultRunLoopMode;  //默认没有优先级
    //extern NSString* const NSRunLoopCommonModes;  //提高优先级

//    lazy var timer:Timer = {
//       let timerr = Timer(timeInterval: 0.2, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
//        return timerr
//    }()

    var errorView:ErrorView = Bundle.main.loadNibNamed("ErrorView", owner: nil, options: nil)?.first as! ErrorView

    var timer:Timer?

    var errorType:ErrorNetType =  .Default {
        didSet{
            self.destoryTimer()
            errorView.isHidden = false
            loadingView.isHidden = true
            switch errorType {
            case .Default:
                errorView.msgLabel.text = "网络错误"
                errorView.msgDetailLabel.text = "请检查网络连接"
            case .NoNet:
                errorView.msgLabel.text = "网络错误"
                errorView.msgDetailLabel.text = "请检查网络连接"
            case .ServerError:
                errorView.msgLabel.text = "出现错误"
                errorView.msgDetailLabel.text = "服务器出错，请稍后重试"
            }
        }
    }

    //        displayLink.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    lazy var displayLink:CADisplayLink  = {
        let link = CADisplayLink(target: self, selector:  #selector(BaseViewController.timerAction))
        return link
    }()

    let loadingView : LoadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(errorView)
        errorView.frame = view.frame;
        errorView.retryBtn.addTarget(self, action: #selector(BaseViewController.retryBtnClick), for: .touchUpInside)

        view.addSubview(loadingView)
        loadingView.frame = view.bounds

        addTimer()

        view.backgroundColor = UIColor.white

//        view.bringSubview(toFront: btn!)
    }

    func retryBtnClick() {
        self.addTimer()
        errorView.isHidden = true
        loadingView.isHidden = false
    }
    
    func timerAction() {
        loadingView.progress = loadingView.progress + 1
    }

    func addTimer() {
        if timer == nil {
            timer = Timer(timeInterval: 0.2, target: self, selector: #selector(BaseViewController.timerAction), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .commonModes)
        }
    }

    func destoryTimer() {
        if timer == nil {
            timer!.invalidate()
            timer = nil
        }
    }

    deinit {
        destoryTimer()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TestViewController()
        self.present(vc, animated: true, completion: nil)
    }
}














