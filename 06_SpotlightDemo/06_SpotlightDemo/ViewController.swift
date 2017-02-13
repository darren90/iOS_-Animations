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
        //标题
        attr.title = "上海"
        //搜索关键字
        attr.keywords = ["金融","shanghai","魔都"]
        //描述信息，可以显示在搜索结果里
        attr.contentDescription = "上海港货物吞吐量和集装箱吞吐量均居世界第一，是一个良好的滨江滨海国际性港口"
        //搜索的图片
        let defalutImgae = UIImage(named:"gankoo01")
        attr.thumbnailData = UIImagePNGRepresentation(defalutImgae!)

        /*
         uniqueIdentifier - 搜索项的唯一标识，类似于应用的 Bundle ID，我们可以在以后通过这个标识来进行后续处理。
         domainIdentifier - 搜索项的域标识，可以把它理解为一个分组 ID，比如我们要对某个分组做批量操作，就可以用这个 ID 来匹配。
         attributeSet - 搜索项的属性集合，其中包括它显示在搜索结果中的标题，描述信息等。
         */

        //这里如果要设置多个可以检索的项目uniqueIdentifier和domainIdentifier必须都不相同
        let sm = CSSearchableItem(uniqueIdentifier: "identifier_001", domainIdentifier: "domainIdentifier_001", attributeSet: attr)

        //用kUTTypeImage 或者 kUTTypeText 没啥影响
        let attr2 = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
        attr2.title = "北京"
        attr2.keywords = ["文化","beijing","雾霾"]
        attr2.contentDescription = "北京由此成为全球首个既举办过夏季奥运会又即将举办冬季奥运会的城市"

        let defalutImgae2 = UIImage(named:"gankoo01")
        attr2.thumbnailData = UIImagePNGRepresentation(defalutImgae2!)

        let sm2 = CSSearchableItem(uniqueIdentifier: "identifier_002", domainIdentifier: "domainIdentifier_002", attributeSet: attr2)

        CSSearchableIndex.default().indexSearchableItems([sm,sm2], completionHandler: { error in
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

