//
//  SearchesViewController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class SearchesViewController: UIViewController {
    
    private let navBar = FilterNavBar(header: "LocationA to LocationB")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    private let listingView = ListingCardView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start () {
        setupProperties()
        layoutViews()
    }
    
}


extension SearchesViewController {
    func setupProperties() {
        view.backgroundColor = UI.Colors.white
        self.hideKeyboardWhenTappedAround()
        nextButton.buttonTapHandler = {  }
    }
    
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Left(), Right(), Top(), FlipperDevice().isiPhoneX() ? Height(135) : Height(105))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
        
        view.addSubview(listingView)
        listingView.easy.layout(Top(20).to(navBar), CenterX())
    }
}
