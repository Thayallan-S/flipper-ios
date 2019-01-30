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

class SellTicketsFlowController: UIViewController {
    
    private let sellTicketsViewController = SellTicketsViewController()
    private let sellTicketsAirlineViewController = SellTicketsAirlineViewController()
    private let bookingDetailsViewController = BookingDetailsViewController()
    private let ticketInformationViewController = TicketInformationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sellTicketsViewController.delegate = self
        sellTicketsAirlineViewController.delegate = self
        sellTicketsAirlineViewController.navBar.delegate = self
        bookingDetailsViewController.navBar.delegate = self
        bookingDetailsViewController.delegate = self
        ticketInformationViewController.navBar.delegate = self
        
        presentSellTicketsViewController()
    }
}

extension SellTicketsFlowController {
    func presentSellTicketsViewController() {
        add(childController: sellTicketsViewController)
    }
}

extension SellTicketsFlowController: SellTicketsViewDelegate {
    func dimissInitialView() {
        remove(childController: sellTicketsViewController)
        add(childController: sellTicketsAirlineViewController)
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
