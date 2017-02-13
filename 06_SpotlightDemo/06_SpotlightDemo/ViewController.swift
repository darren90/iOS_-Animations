//
//  ViewController.swift
//  06_SpotlightDemo
//
//  Created by Fengtf on 2017/2/13.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: -- 添加CoreSpotlight索引
    @IBAction func addCoreSpotlight(_ sender: UIButton) {

        //用kUTTypeImage 或者 kUTTypeText 没啥影响
        let attr = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
        attr.title = "上海"
        attr.keywords = ["金融","shanghai","魔都"]
        attr.contentDescription = "上海港货物吞吐量和集装箱吞吐量均居世界第一，是一个良好的滨江滨海国际性港口"

        let defalutImgae = UIImage(named:"gankoo01")
        attr.thumbnailData = UIImagePNGRepresentation(defalutImgae!)

        let sm = CSSearchableItem(uniqueIdentifier: "identifier_001", domainIdentifier: "domainIdentifier_001", attributeSet: attr)

        CSSearchableIndex.default().indexSearchableItems([sm], completionHandler: { error in
            if error != nil{
                print("创建Spotlight索引失败:\(error?.localizedDescription)")
            }
        })


        //用kUTTypeImage 或者 kUTTypeText 没啥影响
        let attr2 = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
        attr2.title = "北京"
        attr2.keywords = ["文化","beijing","雾霾"]
        attr2.contentDescription = "北京由此成为全球首个既举办过夏季奥运会又即将举办冬季奥运会的城市"

        let defalutImgae2 = UIImage(named:"gankoo01")
        attr2.thumbnailData = UIImagePNGRepresentation(defalutImgae2!)

        let sm2 = CSSearchableItem(uniqueIdentifier: "identifier_002", domainIdentifier: "domainIdentifier_002", attributeSet: attr2)

        CSSearchableIndex.default().indexSearchableItems([sm2], completionHandler: { error in
            if error != nil{
                print("创建Spotlight索引失败:\(error?.localizedDescription)")
            }else{
                let alertVc = UIAlertController(title: "成功", message: "添加Spotlight索引成功", preferredStyle: .alert)
//                let cancelAction = UIAlertAction(title: "取消", style:.cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: .default, handler: nil)
//                alertVc.addAction(cancelAction)
                alertVc.addAction(okAction)
                self.present(alertVc, animated: true, completion: nil)
            }
        })
    }

    //MARK: -- 删除CoreSpotlight索引
    @IBAction func deleCoreSpotlight(_ sender: UIButton) {

        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
            if error != nil{
                print("删除所有Spotlight索引失败:\(error?.localizedDescription)")
            }else{
                print("删除所有Spotlight索引成功")
            }
        }
    }




}

