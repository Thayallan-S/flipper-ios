//
//  SellTicketsFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-25.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol SellTicketsFlowDelegate: class {
    func dismissSellTicketsFlow()
}

class SellTicketsFlowController: UIViewController {
    
    weak var delegate: SellTicketsFlowDelegate?
    
    private let sellTicketsViewController = SellTicketsViewController()
    private let sellTicketsAirlineViewController = SellTicketsAirlineViewController()
    private let bookingDetailsViewController = BookingDetailsViewController()
    private let ticketInformationViewController = TicketInformationViewController()
    private let listPriceViewController = ListPriceViewController()
    private let paymentMethodViewController = PaymentMethodViewController()
    private let reviewViewController = ReviewViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        sellTicketsViewController.delegate = self
        sellTicketsAirlineViewController.delegate = self
        sellTicketsAirlineViewController.navBar.delegate = self
        bookingDetailsViewController.navBar.delegate = self
        bookingDetailsViewController.delegate = self
        ticketInformationViewController.navBar.delegate = self
        ticketInformationViewController.delegate = self
        listPriceViewController.navBar.delegate = self
        listPriceViewController.delegate = self
        paymentMethodViewController.navBar.delegate = self
        paymentMethodViewController.delegate = self
        reviewViewController.navBar.delegate = self
        reviewViewController.delegate = self
        
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        presentSellTicketsViewController()

    }
}

extension SellTicketsFlowController {
    func presentSellTicketsViewController() {
        add(childController: sellTicketsViewController)
        sellTicketsViewController.start()
    }
}

extension SellTicketsFlowController: SellTicketsViewDelegate {
    func dimissInitialView() {
        remove(childController: sellTicketsViewController)
        add(childController: sellTicketsAirlineViewController)
        sellTicketsAirlineViewController.start()
    }
}

extension SellTicketsFlowController: GeneralNavBarDelegate {
    func backButtonTap() {
        if sellTicketsAirlineViewController.navBar.viewTag == 1 {
            remove(childController: sellTicketsAirlineViewController)
            add(childController: sellTicketsViewController)
            sellTicketsAirlineViewController.navBar.viewTag = 0
        }
        if bookingDetailsViewController.navBar.viewTag == 1 {
            remove(childController: bookingDetailsViewController)
            add(childController: sellTicketsAirlineViewController)
            bookingDetailsViewController.navBar.viewTag = 0
        }
        if ticketInformationViewController.navBar.viewTag == 1 {
            remove(childController: ticketInformationViewController)
            add(childController: bookingDetailsViewController)
            ticketInformationViewController.navBar.viewTag = 0
        }
        if listPriceViewController.navBar.viewTag == 1 {
            remove(childController: listPriceViewController)
            add(childController: ticketInformationViewController)
            listPriceViewController.navBar.viewTag = 0
        }
        if paymentMethodViewController.navBar.viewTag == 1 {
            remove(childController: paymentMethodViewController)
            add(childController: listPriceViewController)
            paymentMethodViewController.navBar.viewTag = 0
        }
        if reviewViewController.navBar.viewTag == 1 {
            remove(childController: reviewViewController)
            add(childController: paymentMethodViewController)
            reviewViewController.navBar.viewTag = 0
        }
    }
}

extension SellTicketsFlowController: SellTicketsAirlineViewDelegate {
    func didTapNextAirline() {
        remove(childController: sellTicketsAirlineViewController)
        add(childController: bookingDetailsViewController)
    }
}

extension SellTicketsFlowController: BookingDetailsViewDelegate {
    func didTapNextBookingDetails() {
        remove(childController: bookingDetailsViewController)
        add(childController: ticketInformationViewController)
    }
}

extension SellTicketsFlowController: TicketInformationViewDelegate {
    func didTapNextTicketInfo() {
        remove(childController: ticketInformationViewController)
        add(childController: listPriceViewController)
    }
}

extension SellTicketsFlowController: ListPriceViewDelegate {
    func didTapNextListPrice() {
        remove(childController: listPriceViewController)
        add(childController: paymentMethodViewController)
    }
}

extension SellTicketsFlowController: PaymentMethodViewDelegate {
    func didTapNextPaymentMethod() {
        remove(childController: paymentMethodViewController)
        add(childController: reviewViewController)
    }
}

extension SellTicketsFlowController: ReviewViewDelegate {
    func didTapLooksGood() {
        remove(childController: reviewViewController)
        delegate?.dismissSellTicketsFlow()
    }
}
