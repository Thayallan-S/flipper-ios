//
//  ProfileViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-25.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol ProfileViewDelegate: class {
    func didTapGetStartedPurchased()
    func didTapGetStartedSold()
}
class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewDelegate?
    
    private let shadowView = UIView()
    
    private var status: Int = 0
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(22)
        $0.text = "Profile"
    }
    
    private let profileIcon = UIImageView().then {
        $0.image = UIImage(named: "selectedProfileIcon")
    }
    
    private let nameLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(30)
        $0.text = "Peter Griffin"
    }
    
    private let editProfileLabel = UILabel().then {
        $0.textColor = UI.Colors.swishBlue
        $0.font = UI.Font.regular(11)
        $0.text = "Tap to edit profile"
    }
    
    private let purchasedButton = BorderedButton(title: "Purchased").then {
        $0.pinToEdges()
    }
    
    private let soldButton = BorderedButton(title: "Sold").then {
        $0.pinToEdges()
        $0.layer.borderWidth = 0.2
        $0.colorScheme = .blueOnWhite
        $0.setupColorScheme()
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(18)
        $0.text = "You haven't purchased any tickets yet"
        $0.textAlignment = .center
    }
    
    private let subTitleLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(15)
        $0.text = "You will see your details of ticket purchases here once you purchase a ticket"
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let getStartedButton = BorderedButton(title: "Get Started").then {
        $0.pinToEdges()
        $0.colorScheme = .blueOnWhite
        $0.setupColorScheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        setupProperties()
        layoutViews()
    }
}

extension ProfileViewController {
    func setupProperties() {
        shadowView.backgroundColor = UI.Colors.white
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowColor = UI.Colors.black.cgColor
        shadowView.layer.shadowRadius = 5.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.clipsToBounds = false
    
        purchasedButton.buttonTapHandler = { self.switchColoursSold() }
        soldButton.buttonTapHandler = { self.switchColoursPurchased() }
        getStartedButton.buttonTapHandler = { self.goTo() }
        
    }
    
    func goTo() {
        print("\(status)")
        if status == 0 {
            delegate?.didTapGetStartedPurchased()
        }
        else {
            delegate?.didTapGetStartedSold()
        }
    }
    
    func switchColoursPurchased() {
        status = 1
        view.addSubview(purchasedButton)
        view.addSubview(soldButton)
        purchasedButton.colorScheme = .blueOnWhite
        purchasedButton.setupColorScheme()
        soldButton.colorScheme = .whiteOnBlue
        soldButton.setupColorScheme()
        titleLabel.text = "You haven't sold any tickets yet"
        subTitleLabel.text = "Once you've sold tickets they will be listed here"
    }
    
    func switchColoursSold() {
        status = 0
        view.addSubview(soldButton)
        view.addSubview(purchasedButton)
        purchasedButton.colorScheme = .whiteOnBlue
        purchasedButton.setupColorScheme()
        soldButton.colorScheme = .blueOnWhite
        soldButton.setupColorScheme()
        titleLabel.text = "You haven't purchased any tickets yet"
        subTitleLabel.text = "You will see your details of ticket purchases here once you purchase a ticket"
    }
    
    func layoutViews() {
        view.addSubview(shadowView)
        shadowView.easy.layout(Top(), Width(375), FlipperDevice().isiPhoneX() ? Height(95) : Height(80), Left(), Right())
        
        view.addSubview(headerLabel)
        headerLabel.easy.layout(Left(30), FlipperDevice().isiPhoneX() ? Top(56) : Top(44))
        
        view.addSubview(profileIcon)
        profileIcon.easy.layout(Left(30), Top(30).to(shadowView), Width(50), Height(58))
        
        view.addSubview(nameLabel)
        nameLabel.easy.layout(Top(30).to(shadowView), Left(25).to(profileIcon))
        
        view.addSubview(editProfileLabel)
        editProfileLabel.easy.layout(Top(2).to(nameLabel), Left(25).to(profileIcon))
        
        view.addSubview(soldButton)
        soldButton.easy.layout(Right(28), Left(182), Top(60).to(profileIcon))
        
        view.addSubview(purchasedButton)
        purchasedButton.easy.layout(Left(28), Right(182), Top(60).to(profileIcon))
        
        view.addSubview(titleLabel)
        titleLabel.easy.layout(CenterX(), Top(50).to(purchasedButton))
        
        view.addSubview(subTitleLabel)
        subTitleLabel.easy.layout(Left(72), Right(72), Top(5).to(titleLabel))
        
        view.addSubview(getStartedButton)
        getStartedButton.easy.layout(Left(91), Right(91), Top(25).to(subTitleLabel))
    }
}
