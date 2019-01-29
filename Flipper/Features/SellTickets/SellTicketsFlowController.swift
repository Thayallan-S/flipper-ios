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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentSellTicketsViewController()
    }
}

extension SellTicketsFlowController {
    func presentSellTicketsViewController() {
        add(childController: sellTicketsViewController)
    }
}
