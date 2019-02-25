//
//  ListPriceViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-30.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol ListPriceViewDelegate: class {
    func didTapNextListPrice()
}

class ListPriceViewController: UIViewController {
    
    weak var delegate: ListPriceViewDelegate?
    
    let navBar = GeneralNavBar(header: "List Price", subHeader: "How much are you selling the ticket for ?")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    private let enterYourPriceLabel = UILabel().then {
        $0.textColor = UI.Colors.dullGrey
        $0.font = UI.Font.regular(18)
        $0.text = "Enter Your Price"
    }
    
    private let ticketPriceField = StateTextField(placeholder: "Ticket Price").then {
        $0.textField.keyboardType = .numberPad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        self.dismissKeyboard()
        nextButton.buttonTapHandler = { self.delegate?.didTapNextListPrice() }
        
        layoutViews()
    }
    
}

extension ListPriceViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))

        view.addSubview(enterYourPriceLabel)
        enterYourPriceLabel.easy.layout(Left(25), Top(30).to(navBar))
        
        view.addSubview(ticketPriceField)
        ticketPriceField.easy.layout(CenterX(), Top(30).to(enterYourPriceLabel), Width(325))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
