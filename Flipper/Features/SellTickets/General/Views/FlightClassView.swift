//
//  FlightClassView.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-29.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol FlightClassViewDelegate: class {
    func didChangeColor(button: String)
}

class FlightClassView: UIView {
    
    weak var delegate: FlightClassViewDelegate?
    
    private let contentView = UIView()
    
    var economyButton = BorderedButton(title: "Economy", colorScheme: .blueOnWhite , style: .normal)
    
    var businessButton = BorderedButton(title: "Business", colorScheme: .blueOnWhite , style: .normal)
    
    var firstClassButton = BorderedButton(title: "First Class", colorScheme: .blueOnWhite , style: .normal)

    init() {
        super.init(frame: .zero)
        
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FlightClassView {
    func setupProperties() {
        economyButton.buttonTapHandler = { self.delegate?.didChangeColor(button: "Economy") }
        businessButton.buttonTapHandler = { self.delegate?.didChangeColor(button: "Business") }
        firstClassButton.buttonTapHandler = { self.delegate?.didChangeColor(button: "First Class") }
        
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(335), Height(40), Left(20), Right(20))
        
        contentView.addSubview(economyButton)
        economyButton.easy.layout(Left(), Width(105), Height(40))
        
        contentView.addSubview(businessButton)
        businessButton.easy.layout(Left(10).to(economyButton), Width(105), Height(40))
        
        contentView.addSubview(firstClassButton)
        firstClassButton.easy.layout(Right(), Width(105), Height(40))
    }
}
