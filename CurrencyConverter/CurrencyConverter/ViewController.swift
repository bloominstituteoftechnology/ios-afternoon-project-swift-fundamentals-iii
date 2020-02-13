//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
// enum is an enumerated list of possibilities or variables. Defines an object that can only take certain values
enum Currency {
    case cad
    case mxn
}
var currency: Currency = .cad
var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()




class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let convertInput = Double(fromCurrencyTextField.text!) else { return }
        let convertMoney = convert(convertInput)
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convertMoney))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        if cadButton.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = true
        if mxnButton.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods

    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            return dollars * 1.33
        case .mxn:
            return dollars * 19.70
        }
    }
    func handleToCurrencySelection() {
            mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
            toCurrencyTextField.text = ""

        }
    }

