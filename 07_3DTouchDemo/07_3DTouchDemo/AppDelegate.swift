//
//  AppDelegate.swift
//  07_3DTouchDemo
//
//  Created by Fengtf on 2017/2/13.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        registHomeScreenQuickActions()

        return true
    }


    //动态注册Home Screen Quick Actions
    func registHomeScreenQuickActions(){
//        UIApplicationShortcutIconType
//        localizedTitle
//        localizedSubtitle
//        UIApplicationShortcutIconType
//          templateImageName
//        userInfo

        let item1 = UIApplicationShortcutItem(type: "com.ftf.3DTouchDemo.share", localizedTitle: "分享\"3DTouch\"", localizedSubtitle: "subtitle", icon: UIApplicationShortcutIcon(type: .share), userInfo: ["value" : "分享APP"]);
        // UIApplicationShortcutItem 代表一个item
        // type： 唯一标示符的属性
        // localizedTitle: 显示的标题
        // localizedSubtitle: 显示的二级标题
        // icon：显示的图片，可以自定义，也可以使用系统提供的样式
        // userInfo: 包含一些信息

        // 自定义的icon
        //icon:UIApplicationShortcutIcon(templateImageName: "like")
        UIApplication.shared.shortcutItems = [item1];
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let userInfo = shortcutItem.userInfo {
            print("app entro userInfo : \(userInfo)")

            guard let key = userInfo.keys.first  else {
                 return
            }

            guard let rootVc = self.window?.rootViewController as? UITabBarController else{
                return
            }
            if key == "likekey" {
                rootVc.selectedIndex = 1
            }



            print("key--\(key)")

        }
    }
    


}














