//
//  ViewController.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/11/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImageView = UIImageView(image: UIImage(named: K.Images.background))
    
    let swapButton: UIButton = {
        let swapButton = UIButton()
        swapButton.setImage(UIImage(named: K.Images.swapButton), for: .normal)
        swapButton.addTarget(self, action: #selector(swapButtonPressed), for: .touchUpInside)
        return swapButton
    }()
    
    //MARK: - Actions
    @objc func swapButtonPressed() {
        print("swap button pressed")
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(swapButton)
        swapButton.centerHorizontally().centerVertically()
    }
}

extension UIView {
    @discardableResult
    func centerHorizontally() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        return self
    }
    
    @discardableResult
    func centerVertically() -> UIView{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        return self
    }
    
}

