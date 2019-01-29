//
//  AppFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//


import UIKit

class AppFlowController: UIViewController {
    
    private let splashViewController = SplashViewController()
    private let mainTabBarController = MainTabBarController()
    //private let authFlowController = AuthFlowController()
    private var isLoggedIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        presentSplashViewController()
    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        
        let deadline = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController)
        
        isLoggedIn ? startMainFlowController() : startAuthFlowController()
    }
    
    func startMainFlowController() {
        present(mainTabBarController, animated: false, completion: nil)
    }
    
    func startAuthFlowController() {
        //add(childController: authFlowController)
        //authFlowController.start()
    }
}
                            