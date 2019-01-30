//
//  SellTicketsAirlineViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-29.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol SellTicketsAirlineViewDelegate: class {
    func didTapNextAirline()
}

class SellTicketsAirlineViewController: UIViewController {
    
    weak var delegate: SellTicketsAirlineViewDelegate?
    
    let navBar = GeneralNavBar(header: "Select your Airline", subHeader: "Select the airline you bought the tickets for")
    
    private let airlineField = StateTextField(placeholder: "Select your Airline")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        self.hideKeyboardWhenTappedAround()
        nextButton.buttonTapHandler = { self.delegate?.didTapNextAirline() }
        
        layoutViews()
    }
}

extension SellTicketsAirlineViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))
        
        view.addSubview(airlineField)
        airlineField.easy.layout(CenterX(), Top(40).to(navBar), Width(325))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
