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

let usdMXN = 19.70
let usdCAD = 1.33

var currency: Currency = Currency.cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInput = fromCurrencyTextField.text,
            let dollarAmount = Double(userInput) else {return}
            let result = convert(dollars: dollarAmount)
        toCurrencyTextField.text = currencyFormatter.string(for: result)
    }
    
    func convert(dollars: Double) -> Double {
        switch currency {
        case .cad:
            return dollars * usdCAD
        case .mxn:
            return dollars * usdMXN
        }
    }
    
    
    @IBAction func currencySegmentedController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            toCurrencyLabel.text = "Currency(CAD)"
            currency = .cad
        case 1:
            toCurrencyLabel.text = "Currency(MXN)"
            currency = .mxn
        default:
            currency = .cad
        }
    }
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    
    // MARK: - Helper Methods
}

