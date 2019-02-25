//
//  ProfileLogInViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-24.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

protocol ProfileLogInViewDelegate: class {
    func didTapLogin()
    func didTapSignUp()
}

class ProfileLogInViewController: UIViewController {
    
    var isLoggedIn: Bool = false
    
    weak var delegate: ProfileLogInViewDelegate?
    
    let headerNavBar = GeneralNavBar(header: "Log In", subHeader: "").then {
        $0.viewTag = 0
    }
    
    private let bodyLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(18)
        $0.text = "Enter your mobile phone number to create your account. This will be used to verify that you’re a real user…and not a robot."
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    let emailField = StateTextField(placeholder: "Email").then {
        $0.textField.keyboardType = .emailAddress
    }
    
    let passwordField = StateTextField(placeholder: "Password").then {
        $0.textField.keyboardType = .default
        $0.textField.isSecureTextEntry = true
    }
    
    private let logInButton = BorderedButton(title: "Log In").then {
        $0.pinToEdges()
    }
    
    private let signUpButton = BasicButton(title: "Sign Up").then {
        $0.pinToEdges()
        $0.titleLabel?.font = UI.Font.regular(18)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
    }
}

extension ProfileLogInViewController {
    func setupProperties() {
        view.backgroundColor = UI.Colors.white
        
        logInButton.buttonTapHandler = { self.delegate?.didTapLogin() }
        signUpButton.buttonTapHandler = { self.delegate?.didTapSignUp() }
    }
    
    func layoutViews() {
        view.addSubview(headerNavBar)
        headerNavBar.easy.layout(Width(375), Top(), FlipperDevice().isiPhoneX() ? Height(95) : Height(80))
        
        view.addSubview(bodyLabel)
        bodyLabel.easy.layout(Left(35), Right(35), Top(25).to(headerNavBar))
        
        view.addSubview(emailField)
        emailField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(bodyLabel))
        
        view.addSubview(passwordField)
        passwordField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(emailField))
        
        view.addSubview(logInButton)
        logInButton.easy.layout(Left(40), Right(40), FlipperDevice().isiPhoneX() ? Bottom(148) : Bottom(120))
        
        view.addSubview(signUpButton)
        signUpButton.easy.layout(Left(40), Right(40), Top(10).to(logInButton))
    }
}

extension ProfileLogInViewController: StateTextFieldDelegate {
    func textFieldShouldReturn(_ textField: StateTextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}
