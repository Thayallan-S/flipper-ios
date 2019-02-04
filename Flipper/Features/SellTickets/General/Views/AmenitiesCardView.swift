//
//  AmenitiesCardView.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-30.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol AmenitiesCardViewDelegate: class  {
    func didTapCard(title: String)
}

class AmenitiesCardView: UIView {
    
    weak var delegate: AmenitiesCardViewDelegate?
    
    var state: Bool = false
    
    private let contentView = UIView()
    
    private let iconView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let iconLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(14)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    private var unTappedIcon: String = ""
    
    private var tappedIcon: String = ""
    
    init(title: String, iconName: String, tapIconName: String) {
        super.init(frame: .zero)
        
        unTappedIcon = iconName
        tappedIcon = tapIconName
        iconView.image = UIImage(named: iconName)
        iconLabel.text = title
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AmenitiesCardView {
    @objc func handleButtonTap() {
        delegate?.didTapCard(title: iconLabel.text!)
    }
    func inverseColours() {
        if state {
            contentView.backgroundColor = UI.Colors.swishBlue
            contentView.layer.borderColor = UI.Colors.swishBlue.cgColor
            iconLabel.textColor = UI.Colors.white
            iconView.image = UIImage(named: tappedIcon)
        }
        else {
            contentView.backgroundColor = UI.Colors.white
            contentView.layer.borderColor = UI.Colors.dullGrey.cgColor
            iconLabel.textColor = UI.Colors.black
            iconView.image = UIImage(named: unTappedIcon)
        }
    }
    func setupProperties() {
        contentView.layer.cornerRadius = 5.0
        contentView.layer.borderColor = UI.Colors.dullGrey.cgColor
        contentView.layer.borderWidth = 1.0
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(100), Height(105))
        
        contentView.addSubview(iconView)
        iconView.easy.layout(Top(17), CenterX())
        
        contentView.addSubview(iconLabel)
        iconLabel.easy.layout(CenterX(), Left(10), Right(10), Top(15).to(iconView))
        
        addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
    }
}
