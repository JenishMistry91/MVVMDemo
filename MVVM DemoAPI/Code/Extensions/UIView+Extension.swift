//
//  UIView+Extension.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    func roundCorner(_ radius:CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
