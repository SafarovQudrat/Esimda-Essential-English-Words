//
//  AppDelegate.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeVC()
        let navvc = UINavigationController(rootViewController: vc)
        navvc.navigationBar.isHidden = true
        window?.rootViewController = navvc
        window?.makeKeyAndVisible()
        
        return true
    }

}

