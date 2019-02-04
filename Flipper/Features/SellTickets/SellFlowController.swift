//
//  SellFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

class SellFlowController: UIViewController {
    
    private let sellTicketsFlowController = SellTicketsFlowController()
    private let confirmationFlowController = ConfirmationFlowController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sellTicketsFlowController.delegate = self
        confirmationFlowController.delegate = self
        
        presentSellTicketsFlow()
    }
    
    func presentSellTicketsFlow() {
        add(childController: sellTicketsFlowController)
    }
}

extension SellFlowController: SellTicketsFlowDelegate {
    func dismissSellTicketsFlow() {
        remove(childController: sellTicketsFlowController)
        add(childController: confirmationFlowController)
        confirmationFlowController.start()
    }
}

extension SellFlowController: ConfirmationFlowDelegate {
    func dismissConfirmationFlow() {
        remove(childController: confirmationFlowController)
        add(childController: sellTicketsFlowController)
        sellTicketsFlowController.start()
    }
}
