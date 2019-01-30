//
//  LocationView.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-29.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol LocationViewDelegate: class {
    func didTapLocation(location: String)
}

class LocationView: UIView {
    
    weak var delegate: LocationViewDelegate?
    
    private let contentView = UIView()
    private let locationLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.bold(16)
    }
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    init(location: String) {
        super.init(frame: .zero)
        
        locationLabel.text = location
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationView {
    @objc func handleButtonTap() {
        delegate?.didTapLocation(location: locationLabel.text!)
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(335), Height(40))
        
        contentView.addSubview(locationLabel)
        locationLabel.easy.layout(Left(), Top())
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
        
    }
}
