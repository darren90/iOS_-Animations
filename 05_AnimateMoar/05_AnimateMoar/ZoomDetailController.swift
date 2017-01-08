//
//  ZoomDetailController.swift
//  05_AnimateMoar
//
//  Created by Tengfei on 2017/1/8.
//  Copyright © 2017年 tengfei. All rights reserved.
//

import UIKit

class ZoomDetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我是详情页"
        
        view.backgroundColor = UIColor.white
        
        let leftItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(self.disSelf))
        navigationItem.leftBarButtonItem = leftItem
    }
    
    func disSelf(){
        dismiss(animated: true, completion: nil)
    }
 
 }
