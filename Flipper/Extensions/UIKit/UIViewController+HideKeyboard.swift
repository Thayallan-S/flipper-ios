//
//  UIViewController+HideKeyboard.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-24.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.removeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func removeKeyboard() {
        view.endEditing(true)
    }
}
