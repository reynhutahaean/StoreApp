//
//  AppDelegate.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let home = HomeRouter().createModule()
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = home
        
        return true
    }
}

