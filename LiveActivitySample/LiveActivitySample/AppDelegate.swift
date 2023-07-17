//
//  AppDelegate.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LiveActivityManager.shared.startActivity(title: "Title")
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        LiveActivityManager.shared.stopActivity()
    }
}

