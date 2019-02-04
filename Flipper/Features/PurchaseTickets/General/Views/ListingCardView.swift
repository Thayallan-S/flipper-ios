//
//  ListingCardView.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class ListingCardView: UIView {
    
    private let contentView = UIView()
    
    private let tripLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(20)
        $0.text = "Toronto to Miami"
    }
    
    private let costLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(24)
        $0.text = "$199.99"
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(12)
        $0.text = "Date"
    }
    
    private let dateTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(15)
        $0.text = "January 1, 2019"
    }
    
    init() {
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ListingCardView {
    func setupProperties() {
        contentView.layer.cornerRadius = 7.0
        contentView.layer.borderColor = UI.Colors.heatherGrey.cgColor
        contentView.layer.borderWidth = 0.8
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(330), Height(90))
        
        contentView.addSubview(tripLabel)
        tripLabel.easy.layout(Left(10), Top(10))
        
        contentView.addSubview(costLabel)
        costLabel.easy.layout(Right(10), Top(10))
        
        contentView.addSubview(dateLabel)
        dateLabel.easy.layout(Top(10).to(tripLabel), Left(10))
        
        contentView.addSubview(dateTextLabel)
        dateTextLabel.easy.layout(Top(5).to(dateLabel), Left(10))
    }
}
