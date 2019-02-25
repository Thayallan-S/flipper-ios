//
//  ProfileSignUpViewController.swift
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


protocol ProfileSignUpViewDelegate: class {
    func didSignUp()
}

class ProfileSignUpViewController: UIViewController {
    
    weak var delegate: ProfileSignUpViewDelegate?
    
    let headerNavBar = GeneralNavBar(header: "Sign Up", subHeader: "").then {
        $0.viewTag = 1
    }
    
    let firstNameField = StateTextField(placeholder: "First Name")
    let lastNameField = StateTextField(placeholder: "Last Name")
    let emailField = StateTextField(placeholder: "Email").then {
        $0.textField.keyboardType = .emailAddress
    }
    let passwordField = StateTextField(placeholder: "Password").then {
        $0.textField.isSecureTextEntry = true
    }
    
    private let signUpButton = BorderedButton(title: "Sign Up").then {
        $0.pinToEdges()
        $0.titleLabel?.font = UI.Font.regular(18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        self.dismissKeyboard()
        signUpButton.buttonTapHandler = { self.delegate?.didSignUp() }
        
        layoutViews()
    }
}

extension ProfileSignUpViewController {
    func layoutViews() {
        view.addSubview(headerNavBar)
        headerNavBar.easy.layout(Width(375), Top(), FlipperDevice().isiPhoneX() ? Height(95) : Height(80))
        
        view.addSubview(firstNameField)
        firstNameField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(headerNavBar))
        
        view.addSubview(lastNameField)
        lastNameField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(firstNameField))
        
        view.addSubview(emailField)
        emailField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(lastNameField))
        
        view.addSubview(passwordField)
        passwordField.easy.layout(Left(25), Right(25), Width(325), Top(40).to(emailField))
        
        view.addSubview(signUpButton)
        signUpButton.easy.layout(Left(40), Right(40), FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70))
    }
}


extension ProfileSignUpViewController: StateTextFieldDelegate {
    func textFieldShouldReturn(_ textField: StateTextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}


