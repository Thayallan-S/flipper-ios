//
//  TicketInformationViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-29.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class TicketInformationViewController: UIViewController {
    
    let navBar = GeneralNavBar(header: "Ticket Information", subHeader: "Enter the information for the ticket purchased")

    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    private let firstNameField = StateTextField(placeholder: "First Name")
    
    private let lastNameField = StateTextField(placeholder: "Last Name")
    
    private let ticketNumberField = StateTextField(placeholder: "Ticket Number")
    
    private let classLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(18)
        $0.text = "Class"
    }
    
    private let flightClassView = FlightClassView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        self.hideKeyboardWhenTappedAround()
        nextButton.buttonTapHandler = {  }
        
        layoutViews()
    }
}

extension TicketInformationViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))
        
        view.addSubview(firstNameField)
        firstNameField.easy.layout(CenterX(), Top(25).to(navBar), Width(325))
        
        view.addSubview(lastNameField)
        lastNameField.easy.layout(CenterX(), Top(25).to(firstNameField), Width(325))
        
        view.addSubview(ticketNumberField)
        ticketNumberField.easy.layout(CenterX(), Top(25).to(lastNameField), Width(325))
        
        view.addSubview(classLabel)
        classLabel.easy.layout(Left(25), Top(25).to(ticketNumberField))
        
        view.addSubview(flightClassView)
        flightClassView.easy.layout(Top(5).to(classLabel))
        
    }
}
