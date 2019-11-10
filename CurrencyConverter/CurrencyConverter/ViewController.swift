//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
/* 1. Create a currency type enum above the class and below the import
 * statements. */
enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    /* 2. Create a property named currency of type Currency. This will store the
    * current currency type we'll be converting to. Set an initial value of
    * .cad. */
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        // Go further 1. Customize the output display using a NumberFormatter
        let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()
        let dollar = Double(fromCurrencyTextField.text!)
        let convertedDollar = convert(dollar!)
        // Go further 2. Use the string(from:) method to convert from a number to a String for display
        let formattedConvertedDollar = currencyFormatter.string(from: NSNumber(value: convertedDollar))!
        toCurrencyTextField.text = formattedConvertedDollar
    }
    // 3. In the cadButtonTapped action:
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        // Toggle this button's isSelected state
        cadButton.isSelected.toggle()
        // Toggle the mxn button's isSelected state
        mxnButton.isSelected.toggle()
        // Check this button's state, and if true:
        if cadButton.isSelected{
            // set the currency property to .cad
            currency = .cad
            /* Display the currency in the toCurrencyLabel (so have it say
             * "Currency (CAD)") */
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    // 4. In the mxnButtonTapped action:
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        // Toggle this button's isSelected state
        mxnButton.isSelected.toggle()
        // Toggle the cad button's isSelected state
        cadButton.isSelected.toggle()
        // Check this button's state, and if true:
        if mxnButton.isSelected{
            // set the currency property to .mxn
            currency = .mxn
            // Display the currency in the toCurrencyLabel (so have it say "Currency (MXN)")
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    // MARK: - Helper Methods
    /* 5. Create a helper method to calculate the currency based on the
     * Currency using the method signature: */
    func convert(_ dollars: Double) -> Double {
        let usdToCad: Double = 0.72
        let usdToMxn: Double = 19.11
        /* 6. Check the value of currency to see whether you should convert
         * to CAD or MXN
         * Perform the conversion with the dollars passed into this method
         * Return the converted value */
        guard currency == .mxn  else{ return dollars * usdToMxn }
        return dollars * usdToCad
    }
    var currencyFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
           formatter.numberStyle = .currency
           return formatter
       }()
}
