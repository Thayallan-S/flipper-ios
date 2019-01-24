//
//  BasicButton.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import EasyPeasy


// MARK: - BorderedButton Class Definition
class BasicButton: UIButton {
    
    var buttonTapHandler: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIButton Override Functions
extension BasicButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UI.Colors.heatherGrey.cgColor
        layer.borderWidth = 1.5
        layer.cornerRadius = frame.height / 10
        clipsToBounds = true
        titleLabel?.textColor = UI.Colors.swishBlue
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let newTitle = title == "" ? "        " : title
        super.setTitle(newTitle, for: state)
        setupButtonConstraints()
    }
}

// MARK: - Public Functions
extension BasicButton {
    func pinToEdges(spacing: Float = 40) {
        let size = UIScreen.main.bounds
        self.easy.layout(Width(size.width - CGFloat(spacing * 2)))
    }
    
    func pinToText() {
        setupButtonConstraints()
    }
}

// MARK: - Setup Properties
extension BasicButton {
    private func setupProperties() {
        setBackgroundColor(UI.Colors.white, for: .normal)
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        titleLabel?.font = UI.Font.button
    }
    
    @objc func didTapButton() {
        buttonTapHandler?()
    }
   
    private func setupButtonConstraints() {
        guard let title = titleLabel?.text as NSString? else { return }
        let titleLabelSize = title.size(withAttributes: [NSAttributedString.Key.font: UI.Font.button])
        self.easy.layout(Width(titleLabelSize.width + 60), Height(titleLabelSize.height + 22))
    }
}
