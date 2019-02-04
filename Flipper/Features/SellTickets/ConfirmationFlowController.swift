//
//  ConfirmationFlowController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-01.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

protocol ConfirmationFlowDelegate: class {
    func dismissConfirmationFlow()
}

class ConfirmationFlowController: UIViewController {
    
    weak var delegate: ConfirmationFlowDelegate?
    
    private let confirmationViewController = ConfirmationViewController()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        confirmationViewController.delegate = self

    }
    
    func start() {
        presentConfirmationViewController()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentConfirmationViewController() {
        add(childController: confirmationViewController)
        confirmationViewController.start()
    }
}

extension ConfirmationFlowController: ConfirmationViewDelegate {
    func didTapSoundsGood() {
        remove(childController: confirmationViewController)
        delegate?.dismissConfirmationFlow()
    }
}
