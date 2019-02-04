//
//  PaymentMethodViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//


import UIKit
import EasyPeasy
import Then

protocol PaymentMethodViewDelegate: class {
    func didTapNextPaymentMethod()
}

class PaymentMethodViewController: UIViewController {
    
    weak var delegate: PaymentMethodViewDelegate?
    
    let navBar = GeneralNavBar(header: "Payment Method", subHeader: "Select how you would like to get paid")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    private let paypalCardView = AmenitiesCardView(title: "Paypal", iconName: "", tapIconName: "")
    
    private let creditCardView = AmenitiesCardView(title: "Credit Card", iconName: "", tapIconName: "")
    
    private let applePayCardView = AmenitiesCardView(title: "Apple Pay", iconName: "", tapIconName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        paypalCardView.delegate = self
        creditCardView.delegate = self
        applePayCardView.delegate = self
        
        
        nextButton.buttonTapHandler = { self.delegate?.didTapNextPaymentMethod() }
        
        layoutViews()
    }
    
}

extension PaymentMethodViewController {
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(110) : Height(94))
        
        view.addSubview(paypalCardView)
        paypalCardView.easy.layout(Left(25), Top(20).to(navBar))
        
        view.addSubview(creditCardView)
        creditCardView.easy.layout(CenterX(), Top(20).to(navBar))
        
        view.addSubview(applePayCardView)
        applePayCardView.easy.layout(Right(25), Top(20).to(navBar))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}

extension PaymentMethodViewController: AmenitiesCardViewDelegate {
    func didTapCard(title: String) {
        if title == "Paypal" {
            if paypalCardView.state == false {
                paypalCardView.state = true
                creditCardView.state = false
                applePayCardView.state = false
                paypalCardView.inverseColours()
                creditCardView.inverseColours()
                applePayCardView.inverseColours()
            }
        }
        else if title == "Credit Card" {
            if creditCardView.state == false {
                paypalCardView.state = false
                creditCardView.state = true
                applePayCardView.state = false
                paypalCardView.inverseColours()
                creditCardView.inverseColours()
                applePayCardView.inverseColours()
            }
        }
        else if title == "Apple Pay" {
            if applePayCardView.state == false{
                paypalCardView.state = false
                creditCardView.state = false
                applePayCardView.state = true
                paypalCardView.inverseColours()
                creditCardView.inverseColours()
                applePayCardView.inverseColours()
            }
        }
    }
}
