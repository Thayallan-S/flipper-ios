//
//  ProfileFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

class ProfileFlowController: UIViewController {
    
    private let profileOnboardingViewController = ProfileOnboardingViewController()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        presentOnboardingController()
    }
}

extension ProfileFlowController {
    func presentOnboardingController() {
        
    }
    
    
    func setupPersonalInfoBackHandler() {

    }
}

extension ProfileFlowController {
    struct DependencyContainer {
        let currentController: UIViewController
    }
}
