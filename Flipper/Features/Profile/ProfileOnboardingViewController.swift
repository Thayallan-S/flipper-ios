//
//  ProfileOnboardingViewController.swift
//  Flipper
//
//  Created by Kartik on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy

protocol OnboardingViewDelegate: class {
    func dimissOnboardingView()
}

class ProfileOnboardingViewController: UIViewController {
    
    weak var delegate: OnboardingViewDelegate?
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(22)
        $0.text = "Profile"
    }
    
    private let bodyLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(18)
        $0.text = "Sign in to view your purchased tickets, your tickets for sale and to update your account"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        
    }
    
    private let authButton = BasicButton(title: "Sign up or Log In").then {
        $0.pinToEdges()
    }
    
    private let shadowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UI.Colors.white
        
        setupProperties()
        layoutViews()
    }
    
}

extension ProfileOnboardingViewController {
    func setupProperties() {
        shadowView.backgroundColor = UI.Colors.white
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowColor = UI.Colors.black.cgColor
        shadowView.layer.shadowRadius = 5.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.clipsToBounds = false
        
        authButton.buttonTapHandler = { self.delegate?.dimissOnboardingView() }
    }
    
    func layoutViews() {
        view.addSubview(shadowView)
        shadowView.easy.layout(Top(), Width(375), FlipperDevice().isiPhoneX() ? Height(95) : Height(80), Left(), Right())
        
        view.addSubview(headerLabel)
        headerLabel.easy.layout(Left(30), FlipperDevice().isiPhoneX() ? Top(56) : Top(44))
        
        view.addSubview(bodyLabel)
        bodyLabel.easy.layout(Left(65), Right(65), Top(30).to(shadowView))
        
        view.addSubview(authButton)
        authButton.easy.layout(Left(90), Right(90), Top(40).to(bodyLabel))
    }
}
