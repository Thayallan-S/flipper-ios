//
//  AppDelegate.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appFlowController: AppFlowController!
    
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appFlowController = AppFlowController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appFlowController
        window?.makeKeyAndVisible()
        
        appFlowController?.start()
        FirebaseApp.configure()
        
        return true
    }

}

