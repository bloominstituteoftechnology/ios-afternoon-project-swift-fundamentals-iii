//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
enum Currency {
    case cad
    case mxn
}
let usdMXN: Double = 18.73
let usdCAD: Double = 1.32

var currency: Currency = .cad
class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInput = fromCurrencyTextField.text,
        let dollarAmount = Double(userInput)  else {
            toCurrencyTextField.text = "Invalid Selection"
            return
        }
        toCurrencyTextField.text = String(convert(dollarAmount))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
        }
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            return dollars * usdCAD
        case .mxn:
            return dollars * usdMXN
        }
    }
}

