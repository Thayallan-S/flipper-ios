//
//  ConfirmationViewController.swift
//  Flipper
//
//  Created by Kartik on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol ConfirmationViewDelegate: class {
    func didTapSoundsGood()
}

class ConfirmationViewController: UIViewController {
    
    weak var delegate: ConfirmationViewDelegate?
    
    private let confirmationLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(24)
        $0.text = "Processing...."
    }
    
    private let checkImage = UIImageView().then {
        $0.image = UIImage(named: "checkIcon")
    }
    
    private let confirmationInfoLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(18)
        $0.text = "Your request is currently being reviewed. Within 24 hours you should receive an email letting you know the status of your ticket.     Thank you"
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let soundsGoodButton = BorderedButton(title: "Sounds Good!").then {
        $0.pinToEdges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soundsGoodButton.buttonTapHandler = { self.delegate?.didTapSoundsGood() }
        
       start()
    }
    
    func start() {
        view.backgroundColor = UI.Colors.white

         layoutViews()
    }
}

extension ConfirmationViewController {
    func layoutViews() {
        view.addSubview(confirmationLabel)
        confirmationLabel.easy.layout(CenterX(), Top(80))
        
        view.addSubview(checkImage)
        checkImage.easy.layout(CenterX(), Top(30).to(confirmationLabel), Width(80), Height(80))
        
        view.addSubview(confirmationInfoLabel)
        confirmationInfoLabel.easy.layout(Left(40), Right(40), Top(20).to(checkImage))
        
        view.addSubview(soundsGoodButton)
        soundsGoodButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
