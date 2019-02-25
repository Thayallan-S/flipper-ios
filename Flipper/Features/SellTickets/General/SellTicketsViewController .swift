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

protocol SellTicketsViewDelegate: class {
    func dimissInitialView()
}

class SellTicketsViewController: UIViewController, CLLocationManagerDelegate {
    
    weak var delegate: SellTicketsViewDelegate?
    
    private var fetcher: GMSAutocompleteFetcher?
    
    private let locationManager = CLLocationManager()
    
    private let navBar = TextBoxNavBar(header: "Sell Tickets")
    
    private let nextButton = BorderedButton(title: "Next").then {
        $0.pinToEdges()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = UI.Colors.white
        let filter = GMSAutocompleteFilter()
        filter.type = .city
        
        fetcher = GMSAutocompleteFetcher(bounds: nil, filter: filter)
        fetcher?.delegate = self
        navBar.wherefromTextField.delegate = self
        
        start()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        setupProperties()
        layoutViews()
    }
}

extension SellTicketsViewController: TextFieldDelegate {
    func textFieldDidChange(_ textField: TextField) {
        fetcher?.sourceTextHasChanged(textField.text)

    }
}

extension SellTicketsViewController: GMSAutocompleteFetcherDelegate {
    func didFailAutocompleteWithError(_ error: Error) {
        
    }
    
    func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        let resultStr = NSMutableString()
        for prediction in predictions {
            
        }
    }
}

extension SellTicketsViewController {
    func setupProperties() {
        self.dismissKeyboard()
        nextButton.buttonTapHandler = { self.delegate?.dimissInitialView() }
    }
    func layoutViews() {
        view.addSubview(navBar)
        navBar.easy.layout(Width(375), Height(180))
        
        view.addSubview(nextButton)
        nextButton.easy.layout(FlipperDevice().isiPhoneX() ? Bottom(95) : Bottom(70), Left(20), Right(20))
    }
}
