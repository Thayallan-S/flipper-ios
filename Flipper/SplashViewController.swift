//
//  SplashViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//


import UIKit
import Then
import EasyPeasy

class SplashViewController: UIViewController {
    
    private let backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "background")
        $0.contentMode = .scaleAspectFill
    }
    
    private let flipperLogo = UIImageView().then {
        $0.image = UIImage(named: "flipperLogo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       layoutViews()
    }
}

extension SplashViewController {
    func layoutViews() {
        view.addSubview(backgroundImage)
        backgroundImage.easy.layout(Edges())
        
        view.addSubview(flipperLogo)
        flipperLogo.easy.layout(CenterX(), Width(180), Height(50), FlipperDevice().isiPhoneX() ? Top(300) : Top(340))
    }
}
