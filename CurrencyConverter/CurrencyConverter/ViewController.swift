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


class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    
    var currency: Currency = .cad
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let existingText = fromCurrencyTextField.text else {
            print("Please write something")
            return
        }
        
        guard let money = Double(existingText) else {
            print("You can't convert this")
            return
        }
        
        let convertedTotal = convert(money)
        
        if let priceString = currencyFormatter.string(from: NSNumber(value: convertedTotal)) {
            toCurrencyTextField.text = priceString
        } else {
            toCurrencyTextField.text = "\(convertedTotal)"
        }
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        mxnButton.isSelected = false
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
            toCurrencyTextField.text = ""
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = true
        cadButton.isSelected = false
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
            toCurrencyTextField.text = ""
        }
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            let total = dollars * 1.33
            return total
        case .mxn:
            let total = dollars * 19.70
            return total
        }
    }
    
}

