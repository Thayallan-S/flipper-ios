//
//  FilterNavBar.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-24.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol FilterNavBarDelegate: class {
    func dateTapped()
    func ticketsTapped()
    func filtersTapped()
}

class FilterNavBar: UIView {
    
    private let contentView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(22)
    }
    
    private let backIcon = UIImageView().then {
        $0.image = UIImage(named: "backIcon")
    }
    
    private let shadowView = UIView()
    
    private let datesButton = BasicButton(title: "Dates").then {
        $0.pinToText()
        $0.titleLabel?.font = UI.Font.regular(12)
    }
    private let ticketsButton = BasicButton(title: "Tickets").then {
        $0.pinToText()
        $0.titleLabel?.font = UI.Font.regular(12)

    }
    private let filtersButton = BasicButton(title: "Filters").then {
        $0.pinToText()
        $0.titleLabel?.font = UI.Font.regular(12)
    }
    
    
    init(header: String) {
        super.init(frame: .zero)
        
        headerLabel.text = header
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterNavBar {
    func setupProperties() {
        shadowView.backgroundColor = UI.Colors.white
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowColor = UI.Colors.black.cgColor
        shadowView.layer.shadowRadius = 10.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.clipsToBounds = false
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(375), Height(135), CenterX())
        
        contentView.addSubview(shadowView)
        shadowView.easy.layout(Edges())
        
        contentView.addSubview(backIcon)
        backIcon.easy.layout(Left(20), Width(22), Height(15), FlipperDevice().isiPhoneX() ? Top(58) : Top(50))
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(FlipperDevice().isiPhoneX() ? Top(56) : Top(44), Left(65))
        
        contentView.addSubview(datesButton)
        datesButton.easy.layout(Top(15).to(headerLabel), Left(65), Height(25), Width(90))
        
        contentView.addSubview(ticketsButton)
        ticketsButton.easy.layout(Top(15).to(headerLabel), Left(15).to(datesButton), Height(25), Width(90))
        
        contentView.addSubview(filtersButton)
        filtersButton.easy.layout(Top(15).to(headerLabel), Left(15).to(ticketsButton), Height(25), Width(90))
    }
}
