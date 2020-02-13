//
//  UITextField+Convenience.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/12/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

extension UITextField {

    public convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }

    public convenience init(placeholder: String? = nil, font: UIFont? = .systemFont(ofSize: 14), color: UIColor = .black, keyboardType: UIKeyboardType = .default, inputAccessoryView: UIView? = nil) {
          self.init()
          self.placeholder = placeholder
          self.font = font
          self.textColor = color
          self.keyboardType = keyboardType
          self.inputAccessoryView = inputAccessoryView
    }
    
}

