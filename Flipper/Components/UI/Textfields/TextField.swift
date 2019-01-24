//
//  TextField.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//


import UIKit
import EasyPeasy

@objc protocol TextFieldDelegate: class {
    @objc optional func textFieldDidChange(_ textField: TextField)
    @objc optional func textFieldShouldBeginEditing(_ textField: TextField) -> Bool
    @objc optional func textFieldDidBeginEditing(_ textField: TextField)
    @objc optional func textFieldDidEndEditing(_ textField: TextField)
    @objc optional func textFieldShouldReturn(_ textField: TextField) -> Bool
}

class TextField: UIView {
    
    public weak var delegate: TextFieldDelegate?
    
    private let contentView = UIView()
    
    private let textBox = UIView().then {
        $0.backgroundColor = UI.Colors.whiteGrey
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UI.Colors.whiteGrey.cgColor
        $0.layer.borderWidth = 1.0
    }
    
    private let textField = UITextField().then {
        $0.tag = 0
        $0.font = UI.Font.button
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
        contentView.easy.layout(Top(), Left(), Right(), Bottom(), Height(70))
        
        contentView.addSubview(textBox)
        textBox.easy.layout(Top(), Left(), Right(), Height(46), Bottom())
        
        textBox.addSubview(textField)
        textField.easy.layout(CenterY(), Left(12), Right())
    }
}

extension TextField: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.textFieldDidChange?(self)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(self) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let returnValue = delegate?.textFieldShouldReturn?(self) else { return true }
        return returnValue
    }
}
