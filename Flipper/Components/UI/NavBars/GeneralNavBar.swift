//
//  GeneralNavBar.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol GeneralNavBarDelegate: class {
    func backButtonTap()
}

class GeneralNavBar: UIView {
    
    weak var delegate: GeneralNavBarDelegate?

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
    
    var viewTag: Int = 0
    
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

extension GeneralNavBar {
    @objc func handleButtonTap() {
        viewTag = 1
        delegate?.backButtonTap()
    }
    func setupProperties() {
        shadowView.backgroundColor = UI.Colors.white
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowColor = UI.Colors.black.cgColor
        shadowView.layer.shadowRadius = 5.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.clipsToBounds = false
    }
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges(), Width(375), Height(110), CenterX())
        
        contentView.addSubview(shadowView)
        shadowView.easy.layout(Edges())
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(FlipperDevice().isiPhoneX() ? Top(50) : Top(40), Left(65))
        
        contentView.addSubview(subHeaderLabel)
        subHeaderLabel.easy.layout(Top(5).to(headerLabel), Left(65))
        
        contentView.addSubview(backIcon)
        backIcon.easy.layout(Left(20), Width(27), Height(18), FlipperDevice().isiPhoneX() ? Top(50) : Top(45))
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Left(20), Width(27), Height(18), FlipperDevice().isiPhoneX() ? Top(52) : Top(45))
    }
}
