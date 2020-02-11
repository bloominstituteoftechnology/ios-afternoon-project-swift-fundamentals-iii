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
    
    var currency = Currency.cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromCurrency = fromCurrencyTextField.text, let inputAmount = Double(fromCurrency) else { return }
        let conversionAmount = convert(inputAmount)
        let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            switch currency {
            case .cad: formatter.locale = Locale(identifier: "fr_CA")
            case .mxn: formatter.locale = Locale(identifier: "es_MX")
            }
            formatter.numberStyle = .currency
            return formatter
        }()
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: conversionAmount))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad: return dollars * 1.33
        case .mxn: return dollars * 18.77
        }
    }
}
