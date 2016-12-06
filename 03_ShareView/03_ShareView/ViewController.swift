//
//  ViewController.swift
//  03_ShareView
//
//  Created by Fengtf on 2016/12/6.
//  Copyright © 2016年 ftf. All rights reserved.
//

import UIKit

let UMENG_SHARE_TEXT = "分享测试"
let UMENG_INVITE_SHARE_TEXT = "分享测试 http://www.baidu.com"
let ABOUT_US_URL = "http://www.baidu.com"

//获取屏幕的 高度、宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBtn();

    }
    func createBtn(){
        let btn             = UIButton(type:.custom)
        let btn_frame       = CGRect(x: 0, y: 0, width: 100,height: 44)
        btn.frame           = btn_frame
        btn.center          = self.view.center
        btn.backgroundColor = UIColor.red
        btn.setTitle("点击", for: UIControlState())
        btn.addTarget(self, action: #selector(self.handleBtnAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }

    func handleBtnAction(_ sender:UIButton ){

        //To  Do

        let shareView = TFShareView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        shareView.setShareModel(UMENG_INVITE_SHARE_TEXT, image: UIImage(named: "share_logo")!, url: ABOUT_US_URL, title: UMENG_SHARE_TEXT)

        shareView.showInViewController(self)
    }


}

