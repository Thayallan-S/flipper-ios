//
//  BookingDetailsViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-29.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol BookingDetailsViewDelegate: class {
    func didTapNextBookingDetails()
}

class BookingDetailsViewController: UIViewController {
    
    weak var delegate: BookingDetailsViewDelegate?
    
    let navBar = GeneralNavBar(header: "Booking Details", subHeader: "Enter booking details of ticket purchaser")
    
    private let firstNameField = StateTextField(placeholder: "First Name")
    
    private let lastNameField = StateTextField(placeholder: "Last Name")
    
    private let bookingNumberField = StateTextField(placeholder: "Booking or Reference Number")
    
    //private let passengerField = StateTextField(placeholder: "Number of Tickets")
    
    private let dateDepartureField = StateTextField(placeholder: "Date of Departure")
    
    private let dateArrivalField = StateTextField(placeholder: "Date of Arrival")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        self.dismissKeyboard()
        nextButton.buttonTapHandler = { self.delegate?.didTapNextBookingDetails() }
        
        layoutViews()
    }
}


extension BookingDetailsViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))
        
        view.addSubview(firstNameField)
        firstNameField.easy.layout(CenterX(), Top(27).to(navBar), Width(325))
        
        view.addSubview(lastNameField)
        lastNameField.easy.layout(CenterX(), Top(27).to(firstNameField), Width(325))
        
        view.addSubview(bookingNumberField)
        bookingNumberField.easy.layout(CenterX(), Top(27).to(lastNameField), Width(325))
        
        //view.addSubview(passengerField)
        //passengerField.easy.layout(CenterX(), Top(27).to(bookingNumberField), Width(325))
        
        view.addSubview(dateDepartureField)
        dateDepartureField.easy.layout(CenterX(), Top(27).to(bookingNumberField), Width(325))
        
        view.addSubview(dateArrivalField)
        dateArrivalField.easy.layout(CenterX(), Top(27).to(dateDepartureField), Width(325))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
