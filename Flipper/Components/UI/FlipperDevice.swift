//
//  FlipperDevice.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit
import DeviceKit

struct FlipperDevice {
    
    let device = Device()
    
    var screenSize: CGRect {
        get {
            return UIScreen.main.bounds
        }
    }
    
    func isiPhoneX() -> Bool {
        return device.isOneOf([.iPhoneX, .iPhoneXr, .iPhoneXs, .iPhoneXsMax,
                               .simulator(.iPhoneX), .simulator(.iPhoneXr), .simulator(.iPhoneXs), .simulator(.iPhoneXsMax)])
    }
    
    
}
