//
//  UIButton+Convenience.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/12/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor = .black, font: UIFont = .systemFont(ofSize: 14), backgroundColor: UIColor = .clear, target: Any? = nil, action: Selector? = nil ) {
        self.init(type: .system)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        
        self.backgroundColor = backgroundColor
        
        if let action = action {
            addTarget(target, action: action, for: .primaryActionTriggered)
        }
    }
}
