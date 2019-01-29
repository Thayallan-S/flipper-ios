//
//  SellTicketsViewController .swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-25.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then
import GooglePlaces

class SellTicketsViewController: UIViewController {
    
    private let navBar = TextBoxNavBar(header: "Sell Tickets")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        setupProperties()
        layoutViews()
    }
}

extension SellTicketsViewController {
    func setupProperties() {
        
    }
    
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Width(375), Height(180))
    }
}
