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
    
    // MARK: - Properties
    var currency: Currency = .cad
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    // MARK: - Outlets
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    // MARK: - Actions
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let dollarString = fromCurrencyTextField.text, let dollars = Double(dollarString) else {
            print("Unable to convert to number. Please check your input and try again.")
            return
        }
        
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convert(dollars)))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        mxnButton.isSelected = false
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = true
        cadButton.isSelected = false
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    // $1 to $1.32 CAD
    // $1 to 19.23 MXN
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            return (dollars * 1.32)
        case .mxn:
            return (dollars * 19.23)
        }
    }
}

