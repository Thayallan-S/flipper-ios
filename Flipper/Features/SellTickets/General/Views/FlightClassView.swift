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

class FlightClassView: UIView {
    
    private let contentView = UIView()
    
    private var economyButton = BorderedButton(title: "Economy", colorScheme: .blueOnWhite , style: .normal)
    
    private var businessButton = BorderedButton(title: "Business", colorScheme: .blueOnWhite , style: .normal)
    
    private var firstClassButton = BorderedButton(title: "First Class", colorScheme: .blueOnWhite , style: .normal)

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
        economyButton.buttonTapHandler = { self.changeColorEconomy() }
        businessButton.buttonTapHandler = { self.changeColorBusiness() }
        firstClassButton.buttonTapHandler = { self.changeColorFirstClass() }
        
    }
    
    func changeColorEconomy() {
        if self.economyButton.colorScheme == .blueOnWhite {
            self.economyButton.colorScheme = .whiteOnBlue
            self.businessButton.colorScheme = .blueOnWhite
            self.firstClassButton.colorScheme = .blueOnWhite
            self.economyButton.setupColorScheme()
        }
        else if self.economyButton.colorScheme == .whiteOnBlue {
            self.economyButton.colorScheme = .blueOnWhite
            self.businessButton.colorScheme = .whiteOnBlue
            self.firstClassButton.colorScheme = .whiteOnBlue
            self.economyButton.setupColorScheme()
        }
        
    }
    
    func changeColorBusiness() {
        if self.businessButton.colorScheme == .blueOnWhite {
            self.economyButton.colorScheme = .blueOnWhite
            self.businessButton.colorScheme = .whiteOnBlue
            self.firstClassButton.colorScheme = .blueOnWhite
            self.businessButton.setupColorScheme()
        }
        else if self.businessButton.colorScheme == .whiteOnBlue {
            self.economyButton.colorScheme = .whiteOnBlue
            self.businessButton.colorScheme = .blueOnWhite
            self.firstClassButton.colorScheme = .whiteOnBlue
            self.businessButton.setupColorScheme()
        }
    }
    
    func changeColorFirstClass() {
        if self.firstClassButton.colorScheme == .blueOnWhite {
            self.economyButton.colorScheme = .blueOnWhite
            self.businessButton.colorScheme = .blueOnWhite
            self.firstClassButton.colorScheme = .whiteOnBlue
            self.firstClassButton.setupColorScheme()
        }
        else if self.firstClassButton.colorScheme == .whiteOnBlue {
            self.economyButton.colorScheme = .whiteOnBlue
            self.businessButton.colorScheme = .whiteOnBlue
            self.firstClassButton.colorScheme = .blueOnWhite
            self.firstClassButton.setupColorScheme()
        }
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
