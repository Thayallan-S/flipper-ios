//
//  StateTextField.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy

@objc protocol StateTextFieldDelegate: class {
    @objc optional func textFieldDidChange(_ textField: StateTextField)
    @objc optional func textFieldShouldBeginEditing(_ textField: StateTextField) -> Bool
    @objc optional func textFieldDidBeginEditing(_ textField: StateTextField)
    @objc optional func textFieldDidEndEditing(_ textField: StateTextField)
    @objc optional func textFieldShouldReturn(_ textField: StateTextField) -> Bool
}

class StateTextField: UIView {
    
    public weak var delegate: StateTextFieldDelegate?
    
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.bold(14)
    }
    
    private let textBox = UIView().then {
        $0.backgroundColor = UI.Colors.white
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UI.Colors.white.cgColor
        $0.layer.borderWidth = 1.0
    }
    
    let textField = UITextField().then {
        $0.tag = 0
        $0.font = UI.Font.button
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private let bottomLine = UIView().then {
        $0.backgroundColor = UI.Colors.heatherGrey
    }
    
    override var tag: Int {
        didSet {
            textField.tag = tag
        }
    }
    
    var text: String {
        get {
            return textField.text ?? ""
        } set {
            textField.text = text
        }
    }
    
    var autocorrectionType: UITextAutocorrectionType = .no {
        didSet {
            textField.autocorrectionType = autocorrectionType
        }
    }
    
    var autocapitalizationType: UITextAutocapitalizationType = .none {
        didSet {
            textField.autocapitalizationType = autocapitalizationType
        }
    }
    
    var isSecureTextEntry: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    init(tag: Int = 0, placeholder: String) {
        super.init(frame: .zero)
        
        self.tag = tag
        textField.placeholder = placeholder
        titleLabel.text = placeholder
        
        textField.delegate = self
        
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Top(), Left(), Right(), Bottom(), Height(47))
        
        contentView.addSubview(titleLabel)
        titleLabel.easy.layout(Top(), Left(), Right(), Height(14))
        
        contentView.addSubview(textBox)
        textBox.easy.layout(Top(10).to(titleLabel), Left(), Right(), Height(46), Bottom(5))
        
        textBox.addSubview(textField)
        textField.easy.layout(CenterY(), Left(), Right())
        
        contentView.addSubview(bottomLine)
        bottomLine.easy.layout(Height(1), Left(), Right(), Bottom())
    }
}

extension StateTextField: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.textFieldDidChange?(self)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        titleLabel.textColor = UI.Colors.swishBlue
        bottomLine.backgroundColor = UI.Colors.swishBlue
        return delegate?.textFieldShouldBeginEditing?(self) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.textColor = UI.Colors.black
        bottomLine.backgroundColor = UI.Colors.heatherGrey
        delegate?.textFieldDidEndEditing?(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let returnValue = delegate?.textFieldShouldReturn?(self) else { return true }
        return returnValue
    }
}
