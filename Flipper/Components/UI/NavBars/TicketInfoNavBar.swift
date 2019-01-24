//
//  TicketInfoNavBar.swift
//  Flipper
//
//  Created by Thayallan Srinathan  on 2019-01-24.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol TicketInfoNavBarDelegate: class {
    func backButtonTap()
}

class TicketInfoNavBar: UIView {
    
    weak var delegate: TicketInfoNavBarDelegate?
    
    private let contentView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(22)
    }
    
    private let subHeaderLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(12)
    }
    
    private let backIcon = UIImageView().then {
        $0.image = UIImage(named: "backIcon")
    }
    
    private let shadowView = UIView()
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    init(header: String, subHeader: String) {
        super.init(frame: .zero)
        
        headerLabel.text = header
        subHeaderLabel.text = subHeader
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TicketInfoNavBar {
    @objc func handleButtonTap() {
        delegate?.backButtonTap()
    }
    func setupProperties() {
        shadowView.backgroundColor = UI.Colors.white
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowColor = UI.Colors.black.cgColor
        shadowView.layer.shadowRadius = 10.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.clipsToBounds = false
    }
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(375), Height(160), CenterX())
        
        contentView.addSubview(shadowView)
        shadowView.easy.layout(Edges())
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(FlipperDevice().isiPhoneX() ? Top(56) : Top(44), Left(65))
        
        contentView.addSubview(subHeaderLabel)
        subHeaderLabel.easy.layout(Top(5).to(headerLabel), Left(65))
        
        contentView.addSubview(backIcon)
        backIcon.easy.layout(Left(20), Width(22), Height(15), FlipperDevice().isiPhoneX() ? Top(58) : Top(50))
    }
}
