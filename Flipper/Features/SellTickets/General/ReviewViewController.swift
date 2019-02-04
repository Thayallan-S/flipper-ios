//
//  ReviewViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol ReviewViewDelegate: class {
    func didTapLooksGood()
}

class ReviewViewController: UIViewController {
    
    weak var delegate: ReviewViewDelegate?
    
    let navBar = GeneralNavBar(header: "Review", subHeader: "To edit, tap section you would like to edit")
    
    private let looksGoodButton = BorderedButton(title: "Looks Good!").then {
        $0.pinToEdges()
    }
    
    private let airlineLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(14)
        $0.text = "Airline"
    }
    
    private let airlineTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(22)
        $0.text = "Airline"
    }
    
    private let fromLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(14)
        $0.text = "From"
    }
    
    private let fromTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(22)
        $0.text = "Toronto"
    }
    
    private let toLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(14)
        $0.text = "To"
    }
    
    private let toTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(22)
        $0.text = "Miami"
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(14)
        $0.text = "Date"
    }
    
    private let dateTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(22)
        $0.text = "January 1, 2019"
    }
    
    private let ticketPriceLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(14)
        $0.text = "Ticket Price"
    }

    private let ticketPriceTextLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(22)
        $0.text = "$199.99"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        
        
        looksGoodButton.buttonTapHandler = { self.delegate?.didTapLooksGood() }
        
        layoutViews()
    }
}


extension ReviewViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))
        
        view.addSubview(airlineLabel)
        airlineLabel.easy.layout(Left(20), Top(50).to(navBar))
        
        view.addSubview(airlineTextLabel)
        airlineTextLabel.easy.layout(Left(20), Top(5).to(airlineLabel))
        
        view.addSubview(fromLabel)
        fromLabel.easy.layout(Left(20), Top(45).to(airlineTextLabel))
        
        view.addSubview(fromTextLabel)
        fromTextLabel.easy.layout(Left(20), Top(5).to(fromLabel))
        
        view.addSubview(toLabel)
        toLabel.easy.layout(Left(70).to(fromTextLabel), Top(45).to(airlineTextLabel))
        
        view.addSubview(toTextLabel)
        toTextLabel.easy.layout(Left(70).to(fromTextLabel), Top(5).to(toLabel))
        
        view.addSubview(dateLabel)
        dateLabel.easy.layout(Left(20), Top(45).to(toTextLabel))
        
        view.addSubview(dateTextLabel)
        dateTextLabel.easy.layout(Left(20), Top(5).to(dateLabel))
        
        view.addSubview(ticketPriceLabel)
        ticketPriceLabel.easy.layout(Left(20), Top(45).to(dateTextLabel))
        
        view.addSubview(ticketPriceTextLabel)
        ticketPriceTextLabel.easy.layout(Left(20), Top(5).to(ticketPriceLabel))
        
        view.addSubview(looksGoodButton)
        looksGoodButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
