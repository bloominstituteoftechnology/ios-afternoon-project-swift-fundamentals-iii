//
//  ViewController.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/11/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let conversionCalculator = ConversionCalculator()

    let backgroundImageView = UIImageView(image: UIImage(named: K.Images.background))
    
    let swapButton: UIButton = {
        let swapButton = UIButton()
        swapButton.setImage(UIImage(named: K.Images.swapButton), for: .normal)
        swapButton.addTarget(self, action: #selector(swapButtonPressed), for: .touchUpInside)
        return swapButton
    }()
    
    let topCurrencyButton = UIButton(title: "USD", titleColor: K.tanColor, font: K.mainFont, target: self, action: #selector(topCurrencyPressed))
    let topValueTextField = UITextField(placeholder: "$0.00", font: K.mainFont, color: K.tanColor, keyboardType: .numberPad, inputAccessoryView: nil)
    let bottomCurrencyButton = UIButton(title: "EUR", titleColor: K.greenColor, font: K.mainFont, target: self, action: #selector(bottomCurrencyPressed))
    let bottomValueTextField = UITextField(placeholder: "$0.00", font: K.mainFont, color: K.greenColor, keyboardType: .numberPad, inputAccessoryView: nil)
    
    //MARK: - Actions
    @objc func swapButtonPressed() {
        print("swap button pressed")
    }
    
    @objc func topCurrencyPressed() {
        print("top currency pressed")
    }
    
    @objc func bottomCurrencyPressed() {
          print("bottom currency pressed")
      }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        //conversionCalculator.fetchLatestRates()
        
        layoutViews()
    }
    
    func layoutViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperview()
        
        view.addSubview(swapButton)
        swapButton.centerHorizontally().centerVertically()
        
        let topStack = UIStackView(arrangedSubviews: [topCurrencyButton, topValueTextField])
        view.addSubview(topStack)
        topStack.centerHorizontally().centerVertically(multiplier: 0.4)
        topStack.axis = .vertical
        topStack.alignment = .center
        
        let bottomStack = UIStackView(arrangedSubviews: [bottomCurrencyButton, bottomValueTextField])
        view.addSubview(bottomStack)
        bottomStack.centerHorizontally().centerVertically(multiplier: 1.6)
        bottomStack.axis = .vertical
        bottomStack.alignment = .center
    }
}



