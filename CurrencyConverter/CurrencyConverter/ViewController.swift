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

// I was relectant to declare a global variable but couldn't otherwise figure out how to access the
// state of currency from inside seperate functions.

var currency: Currency = .cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    // Checks the user input for a valid number
    // If the entry is invalid, it prints a message to the result text field
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usdInputString = fromCurrencyTextField.text else {
            return
        }
        guard let usdInput = Double(usdInputString) else {
            print("Invalid number was entered")
            toCurrencyTextField.text = "Invalid number"
            return
        }
 
        /*  I commented out the next block of code because I had first declared the currency variable of type Currency in this location.  However, when I did that I couldn't change the status in the ButtonTapped functions.  The only way I figured out to make it work was to declare it as a global variable.  I left this next section here so I could compare it with whatever the best solution might be.
         
        // Declare a variable to keep track of the desired conversion
            var currency: Currency = .cad
        // Set the current status of currency to match the appropriate button that is selected
        
       if cadButton.isSelected {
            currency = .cad
        } else if mxnButton.isSelected {
            currency = .mxn
        }
         */
 
        // Call the appropriate currency conversion function, convertToCAD or convertToMXN
        // The return is a string, formatted into the correct currency and is displayed in the result field
        // It also will change the label next to result to match the button pressed

        switch currency {
        case .cad:
            toCurrencyLabel.text = "Currency (CAD)"
            let convertedCAD = convertToCAD(usdInput)
            toCurrencyTextField.text = "\(convertedCAD)"
        case .mxn:
            toCurrencyLabel.text = "Currency (Peso)"
            let convertedMXN = convertToMXN(usdInput)
            toCurrencyTextField.text = "\(convertedMXN)"
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected {
            currency = .cad
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if sender.isSelected {
            currency = .mxn
        }
    }
    
    // MARK: - Helper Methods
    
    // the function will be used by the converter to format it into a string with appropriate currency format (CAD or MXN)
    func numberFormatter(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if cadButton.isSelected {
            formatter.locale = Locale(identifier: "en_CA")  // the currency locale for english Canada is en_CA
        } else {
            formatter.locale = Locale(identifier: "es_MX") // the currency locale for Mexico is es_MX
        }
        return formatter.string(from: NSNumber(value: amount))!
    }
    
    // Converting from US dollars into Canada dollars and formatting as a currency
    // Exchange rate is accurate as of Sept 10, 2019
    func convertToCAD(_ dollars: Double) -> String {
        let dollarsInCAD = dollars * 1.31
        return numberFormatter(amount: dollarsInCAD)
    }
    
    // Converting from US dollars into Mexico pesos and formatting as a currency
    // Exchange rate is accurate as of Sept 10, 2019
    func convertToMXN(_ dollars: Double) -> String {
        let dollarsInMXN = dollars * 19.48
        return numberFormatter(amount: dollarsInMXN)
    }
}

