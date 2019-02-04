//
//  ProfileFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ProfileFlowController: UIViewController {
    
    private let profileOnboardingViewController = ProfileOnboardingViewController()
    private let logInViewController = ProfileLogInViewController()
    private let signUpViewController = ProfileSignUpViewController()
    let profileViewController = ProfileViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        profileOnboardingViewController.delegate = self
        logInViewController.headerNavBar.delegate = self
        logInViewController.delegate = self
        signUpViewController.headerNavBar.delegate = self
        signUpViewController.delegate = self
        
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
        add(childController: profileOnboardingViewController)
    }
    func presentLogInController() {
        add(childController: logInViewController)
    }
}

extension ProfileFlowController {
    struct DependencyContainer {
        let currentController: UIViewController
    }
}

extension ProfileFlowController: OnboardingViewDelegate {
    func dimissOnboardingView() {
        remove(childController: profileOnboardingViewController)
        presentLogInController()
    }
}

extension ProfileFlowController: GeneralNavBarDelegate {
    func backButtonTap() {
        if logInViewController.headerNavBar.viewTag == 1 {
            remove(childController: logInViewController)
            add(childController: profileOnboardingViewController)
            logInViewController.headerNavBar.viewTag = 0
        }
        else if signUpViewController.headerNavBar.viewTag == 1 {
            remove(childController: signUpViewController)
            add(childController: logInViewController)
            signUpViewController.headerNavBar.viewTag = 0
        }
    }
}

extension ProfileFlowController: ProfileLogInViewDelegate {
    func didTapLogin() {
        logInViewController.login(withEmail: logInViewController.emailField.textField.text!, password: logInViewController.passwordField.textField.text!)
        print("\(Auth.auth().currentUser?.email)")
    }
    
    func didTapSignUp() {
        remove(childController: logInViewController)
        add(childController: signUpViewController)
    }
}

extension ProfileFlowController: ProfileSignUpViewDelegate {
    func didSignUp() {
        print("\(signUpViewController.emailField.textField.text!)")
        print("\(signUpViewController.passwordField.textField.text!)")
    }
}
