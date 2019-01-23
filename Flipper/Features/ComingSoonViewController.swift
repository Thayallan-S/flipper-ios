//
//  ComingSoonViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//


import UIKit
import Then
import EasyPeasy

class ComingSoonViewController: UIViewController {
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "comingSoonBackground")!).then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let comingSoonLabel = UILabel().then {
        $0.text = "This Page is Coming Soon"
        $0.textAlignment = .center
        $0.font = UI.Font.regular(24)
        $0.textColor = UI.Colors.white
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        layoutViews()
    }
}

// MARK: Layout Views
extension ComingSoonViewController {
    func layoutViews() {
        layoutBackgroundImageView()
        layoutComingSoonLabel()
    }
    
    func layoutBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.easy.layout(Top(-2), Bottom(110), Left(-1), Right(-1))
    }
    
    func layoutComingSoonLabel() {
        view.addSubview(comingSoonLabel)
        comingSoonLabel.easy.layout(FlipperDevice().isiPhoneX() ? Top(204) : Top(180), CenterX(0))
    }
}
