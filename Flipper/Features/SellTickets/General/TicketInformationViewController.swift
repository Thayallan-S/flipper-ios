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
    
    private let firstNameField = StateTextField(placeholder: "First Name")
    
    private let lastNameField = StateTextField(placeholder: "Last Name")
    
    private let ticketNumberField = StateTextField(placeholder: "Ticket Number")
    
    private let classLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(18)
        $0.text = "Class"
    }
    
    private let flightClassView = FlightClassView()
    
    private let amenitiesAndAddOnsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(18)
        $0.text = "Amenities and Add Ons"
    }
    
    private let extraLuggageView = AmenitiesCardView(title: "Extra Luggage", iconName: "luggageIcon", tapIconName: "tappedLuggageIcon")
    
    private let extraLegSpaceView = AmenitiesCardView(title: "Extra Leg Space", iconName: "legSpaceIcon", tapIconName: "tappedLegSpaceIcon")
    
    private let mealOptionView = AmenitiesCardView(title: "Meal Option", iconName: "mealIcon", tapIconName: "tappedMealIcon")
    
    private let petsView = AmenitiesCardView(title: "Pets", iconName: "petIcon", tapIconName: "tappedPetIcon")

    private let vipLoungeView = AmenitiesCardView(title: "VIP Lounge", iconName: "vipLoungeIcon", tapIconName: "tappedVIPLoungeIcon")

    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        flightClassView.delegate = self
        
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
        firstNameField.easy.layout(CenterX(), Top(15).to(navBar), Width(325))
        
        view.addSubview(lastNameField)
        lastNameField.easy.layout(CenterX(), Top(15).to(firstNameField), Width(325))
        
        view.addSubview(ticketNumberField)
        ticketNumberField.easy.layout(CenterX(), Top(15).to(lastNameField), Width(325))
        
        view.addSubview(classLabel)
        classLabel.easy.layout(Left(25), Top(15).to(ticketNumberField))
        
        view.addSubview(flightClassView)
        flightClassView.easy.layout(Top(5).to(classLabel))
        
        view.addSubview(amenitiesAndAddOnsLabel)
        amenitiesAndAddOnsLabel.easy.layout(Left(25), Top(15).to(flightClassView))
        
        view.addSubview(extraLuggageView)
        extraLuggageView.easy.layout(Left(20), Top(15).to(amenitiesAndAddOnsLabel))
        
        view.addSubview(extraLegSpaceView)
        extraLegSpaceView.easy.layout(Left(15).to(extraLuggageView), Top(15).to(amenitiesAndAddOnsLabel))
        
        view.addSubview(mealOptionView)
        mealOptionView.easy.layout(Left(15).to(extraLegSpaceView), Top(15).to(amenitiesAndAddOnsLabel))
        
        view.addSubview(petsView)
        petsView.easy.layout(Left(20), Top(15).to(extraLuggageView))
        
        view.addSubview(vipLoungeView)
        vipLoungeView.easy.layout(Left(15).to(petsView), Top(15).to(extraLuggageView))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
        
    }
}

extension TicketInformationViewController: FlightClassViewDelegate {
    func didChangeColor(button: String) {
        if button == "Economy" {
            if flightClassView.economyButton.colorScheme == .blueOnWhite {
                flightClassView.economyButton.colorScheme = .whiteOnBlue
                flightClassView.businessButton.colorScheme = .blueOnWhite
                flightClassView.firstClassButton.colorScheme = .blueOnWhite
                flightClassView.economyButton.setupColorScheme()
                flightClassView.businessButton.setupColorScheme()
                flightClassView.firstClassButton.setupColorScheme()
            }
        }
        else if button == "Business" {
            if flightClassView.businessButton.colorScheme == .blueOnWhite {
                flightClassView.economyButton.colorScheme = .blueOnWhite
                flightClassView.businessButton.colorScheme = .whiteOnBlue
                flightClassView.firstClassButton.colorScheme = .blueOnWhite
                flightClassView.economyButton.setupColorScheme()
                flightClassView.businessButton.setupColorScheme()
                flightClassView.firstClassButton.setupColorScheme()
            }
        }
        else if button == "First Class" {
            if flightClassView.firstClassButton.colorScheme == .blueOnWhite {
                flightClassView.economyButton.colorScheme = .blueOnWhite
                flightClassView.businessButton.colorScheme = .blueOnWhite
                flightClassView.firstClassButton.colorScheme = .whiteOnBlue
                flightClassView.economyButton.setupColorScheme()
                flightClassView.businessButton.setupColorScheme()
                flightClassView.firstClassButton.setupColorScheme()
            }
        }
    }
}
