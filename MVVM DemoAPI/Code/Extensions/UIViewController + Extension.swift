//
//  UIViewController + Extension.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 25/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
