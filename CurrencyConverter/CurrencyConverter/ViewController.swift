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
    var currency: Currency = .cad
    let conversionDictionary = ["CAD" : 1.33, "MXN": 19.70]
    
    var currencyFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        if let dollarsInput = fromCurrencyTextField.text,
            let dollar = Double(dollarsInput),
            let currencyFormatted = currencyFormatter.string(from: NSNumber(value: convert(dollar))){
            
            toCurrencyTextField.text = currencyFormatted
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.backgroundColor = #colorLiteral(red: 0.1306751072, green: 0.5215686275, blue: 0.9667938352, alpha: 1)
        cadButton.setTitleColor(.white, for:    .normal)
        mxnButton.backgroundColor = .white
        mxnButton.setTitleColor(#colorLiteral(red: 0.1306751072, green: 0.5215091109, blue: 0.9667938352, alpha: 1), for: .normal)
        
        mxnButton.isSelected = false
        currency = .cad
        toCurrencyLabel.text = "Currency (CAD)"
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.backgroundColor = #colorLiteral(red: 0.1306751072, green: 0.5215091109, blue: 0.9667938352, alpha: 1)
        mxnButton.setTitleColor(.white, for: .normal)
        cadButton.backgroundColor = .white
        cadButton.setTitleColor(#colorLiteral(red: 0.1306751072, green: 0.5215091109, blue: 0.9667938352, alpha: 1), for: .normal)
        
        cadButton.isSelected = false
        currency = .mxn
        toCurrencyLabel.text = "Currency (MXN)"
      
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
            switch currency {
            case .cad:
                return conversionDictionary["CAD"]! * dollars
            case .mxn:
                return conversionDictionary["MXN"]! * dollars
            }
    }
}

