//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let usCurrency = Double(usCurrencyString) else { return }
        
        let convertedCurrency: Double = convert(usCurrency)
        
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convertedCurrency))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if(cadButton.isSelected) {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        if(mxnButton.isSelected) {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    // CAD - 1.33
    // MXN - 19.78
    
    enum Currency {
        case cad
        case mxn
    }
    
    var currency: Currency = .cad
    
    func convert(_ dollars: Double) -> Double {
        if (currency == .cad) {
            let cad = dollars * 1.33
            return cad
        } else {
            let mxn = dollars * 19.78
            return mxn
        }
    }
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}

