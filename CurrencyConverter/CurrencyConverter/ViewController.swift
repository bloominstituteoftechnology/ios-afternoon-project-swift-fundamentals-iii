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
    
    var currency: Currency = .cad
    var location: String = "en_CA"
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        //check to see if there is something entered
        guard let stringDollars = fromCurrencyTextField.text else {return}
        
        //check to see if it converts to a double
        guard let dollars = Double(stringDollars) else {
            print("Invalid number")
            return
        }
        toCurrencyTextField.text = convertDoubleToCurrency(convert(dollars))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        //toggle the buttons
        toggleButtons()
        
        //check to see if this button is selected and set to the currency to canadian
        setCurrency()
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        //toggle the buttons
        toggleButtons()
        
        //check to see if the mxn button is selected and set the currency to mexican
        setCurrency()
    }
    
    // MARK: - Helper Methods
    func toggleButtons() {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
    }
    
    func setCurrency() {
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            location = "en_CA"
            return dollars * 1.32
        case .mxn:
            location = "es_MX"
            return dollars * 18.72
        }
    }
    
    func convertDoubleToCurrency(_ amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: location)
        
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
}

