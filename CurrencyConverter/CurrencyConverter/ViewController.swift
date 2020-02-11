//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: String {
    case cad = "CAD"
    case mxn = "Peso"
    
    var conversionRate: Double {
        switch self {
        case .cad:
            return 1.33
        case .mxn:
            return 19.7
        }
    }
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currency = Currency.cad

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputString = fromCurrencyTextField.text,
            let inputAmount = Double(inputString) else {
                return
        }
        toCurrencyTextField.text = "$\(convert(inputAmount))"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        toggleCurrency()
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        toggleCurrency()
    }
    
    // MARK: - Helper Methods
    
    func toggleCurrency() {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        currency = cadButton.isSelected ? .cad : .mxn
        toCurrencyLabel.text = "Currency: (\(currency.rawValue))"
        
        // If toggling, we should also either clear the toCurrencyTextField re-convert
        toCurrencyTextField.text = ""
    }
    
    func convert(_ dollars: Double) -> Double {
        dollars * currency.conversionRate
    }
}

