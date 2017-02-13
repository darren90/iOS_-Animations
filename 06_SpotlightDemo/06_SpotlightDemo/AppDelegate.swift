//
//  AppDelegate.swift
//  06_SpotlightDemo
//
//  Created by Fengtf on 2017/2/13.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


    //通过Spotlight进入APP
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {

        if userActivity?.activityType == CSSearchableItemActionType {
            //            let idetifier = (userActivity?.userInfo?[CSSearchableItemActivityIdentifier] as? String) !
            guard let idfier = userActivity?.userInfo?[CSSearchableItemActivityIdentifier] as? String else {
                return false
            }

            if idfier == "gankoo" {
                print(userActivity?.userInfo ?? "")
            }
        }
        
        return true
    }


}

