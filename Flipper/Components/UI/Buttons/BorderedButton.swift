//
//  BorderedButton.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy

// MARK: - BorderedButton Enumeration Definitions
extension BorderedButton {
    enum ColorScheme {
        case whiteOnBlue
        case blueOnWhite
    }
    
    enum Style {
        case normal
        case slim
    }
}

// MARK: - BorderedButton Class Definition
class BorderedButton: UIButton {
    
    var buttonTapHandler: (() -> Void)?
    var colorScheme: ColorScheme
    private var style: Style
    
    init(title: String, colorScheme: ColorScheme = .whiteOnBlue, style: Style = .normal) {
        self.colorScheme = colorScheme
        self.style = style
        
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIButton Override Functions
extension BorderedButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UI.Colors.swishBlue.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = frame.height / 10
        clipsToBounds = true
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let newTitle = title == "" ? "        " : title
        super.setTitle(newTitle, for: state)
        setupButtonConstraints()
    }
}

// MARK: - Public Functions
extension BorderedButton {
    func pinToEdges(spacing: Float = 40) {
        let size = UIScreen.main.bounds
        self.easy.layout(Width(size.width - CGFloat(spacing * 2)))
    }
    
    func pinToText() {
        setupButtonConstraints()
    }
}

// MARK: - Setup Properties
extension BorderedButton {
    private func setupProperties() {
        setupColorScheme()
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        titleLabel?.font = self.style == .normal ? UI.Font.button : UI.Font.button
    }
    
    @objc func didTapButton() {
        buttonTapHandler?()
    }
    
    func setupColorScheme() {
        switch self.colorScheme {
        case .whiteOnBlue:
            setTitleColor(UI.Colors.white, for: .normal)
            setBackgroundColor(UI.Colors.swishBlue, for: .normal)
            layer.borderColor = UI.Colors.swishBlue.cgColor
        case .blueOnWhite:
            setTitleColor(UI.Colors.swishBlue, for: .normal)
            setBackgroundColor(UI.Colors.white, for: .normal)
            layer.borderColor = UI.Colors.heatherGrey.cgColor
        }
    }
    
    private func setupButtonConstraints() {
        guard let title = titleLabel?.text as NSString? else { return }
        let titleLabelSize = title.size(withAttributes: [NSAttributedString.Key.font: UI.Font.button])
        self.easy.layout(Width(titleLabelSize.width + (self.style == .normal ? 60 : 35)), Height(titleLabelSize.height + (self.style == .normal ? 22 : 11)))
    }
}
