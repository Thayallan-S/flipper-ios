//
//  TextBoxNavBar.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-24.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class TextBoxNavBar: UIView {
        
    private let contentView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.regular(22)
    }
    private let wherefromTextField = TextField(placeholder: "Where from?")
    private let whereToTextField = TextField(placeholder: "Where to?")
    
    private let shadowView = UIView()
   
    
    init(header: String) {
        super.init(frame: .zero)
        
        headerLabel.text = header
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextBoxNavBar {
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
        contentView.easy.layout(Edges(), Width(375), Height(180), CenterX())
        
        contentView.addSubview(shadowView)
        shadowView.easy.layout(Edges())
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(FlipperDevice().isiPhoneX() ? Top(56) : Top(44), Left(32))
        
        contentView.addSubview(wherefromTextField)
        wherefromTextField.easy.layout(Left(32), Right(32), Width(310), Height(35), Top(15).to(headerLabel))
        
        contentView.addSubview(whereToTextField)
        whereToTextField.easy.layout(Left(32), Right(32), Width(310), Height(35), Top(5).to(wherefromTextField))
    }
}
