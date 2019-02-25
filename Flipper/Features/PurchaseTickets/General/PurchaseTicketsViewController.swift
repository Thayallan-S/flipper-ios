//
//  PurchaseTicketsViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol PurchaseTicketsViewDelegate: class {
    func didTapNextPurchaseTickets()
}

class PurchaseTicketsViewController: UIViewController {
    
    weak var delegate: PurchaseTicketsViewDelegate?
    
    private let navBar = TextBoxNavBar(header: "Purchase Tickets")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start () {
        setupProperties()
        layoutViews()
    }
}

extension PurchaseTicketsViewController {
    func setupProperties() {
        view.backgroundColor = UI.Colors.white
        //self.hideKeyboard()
        nextButton.buttonTapHandler = { self.delegate?.didTapNextPurchaseTickets()}
    }
    
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Width(375), Height(180))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
