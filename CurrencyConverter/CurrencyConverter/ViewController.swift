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
        guard let exchangeString = fromCurrencyTextField.text,
            let amountToExchange = Double(exchangeString) else { return }
        
        let exchangedAmount = convert(amountToExchange)
        
        guard let exchangedAmountFormatted = currencyFormatter.string(from: NSNumber(value: exchangedAmount)) else { return }
        
        toCurrencyTextField.text = "\(exchangedAmountFormatted)"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
//        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (🇨🇦)"
        }
        
        convertButtonTapped(UIButton())
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (🇲🇽)"
        }
        
        convertButtonTapped(UIButton())
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        let cadExchangeRate = 1.32
        let mxnExchangeRate = 19.78
        let amountToExchange = dollars
        var exchangedAmount = 0.0
        
        switch currency {
        case .cad:
            exchangedAmount = amountToExchange * cadExchangeRate
        case .mxn:
            exchangedAmount = amountToExchange * mxnExchangeRate
        }
        
        return exchangedAmount
    }
}

