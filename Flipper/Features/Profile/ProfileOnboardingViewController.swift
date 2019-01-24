//
//  ProfileOnboardingViewController.swift
//  Flipper
//
//  Created by Kartik on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileOnboardingViewController: UIViewController {
    
    private let textField = StateTextField(placeholder: "Where to?")
    
    private let button = BasicButton(title: "Sign Up Or Log In").then {
        $0.pinToText()
    }
    private var tapGestureRecognizer: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UI.Colors.white
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        setupProperties()
        layoutViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.removeGestureRecognizer(tapGestureRecognizer)
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ProfileOnboardingViewController {
    func setupProperties() {
        
    }
    
    func layoutViews() {
        view.addSubview(textField)
        textField.easy.layout(CenterX(), CenterY(), Width(300), Height(50))
        
        view.addSubview(button)
        button.easy.layout(Left(80), Right(80), Top(20).to(textField))
    }
}
