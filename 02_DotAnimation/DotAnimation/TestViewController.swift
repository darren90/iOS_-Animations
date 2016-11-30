//
//  TestViewController.swift
//  DotAnimation
//
//  Created by Fengtf on 2016/11/30.
//  Copyright © 2016年 tengfei. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    @IBAction func disMiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2*NSEC_PER_SEC))/Double(NSEC_PER_SEC)) {

            self.errorType = .Default

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
}
