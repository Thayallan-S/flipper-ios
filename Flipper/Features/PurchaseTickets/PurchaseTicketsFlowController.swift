//
//  PurchaseTicketsFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

class PurchaseTicketsFlowController: UIViewController {
    
    private let purchaseTicketsViewController = PurchaseTicketsViewController()
    private let searchesViewController = SearchesViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        purchaseTicketsViewController.delegate = self
        
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        startPurchaseTicketsViewController()
    }
    
    func startPurchaseTicketsViewController() {
        add(childController: purchaseTicketsViewController)
    }
    
}

extension PurchaseTicketsFlowController: PurchaseTicketsViewDelegate {
    func didTapNextPurchaseTickets() {
        remove(childController: purchaseTicketsViewController)
        add(childController: searchesViewController)
    }
}
