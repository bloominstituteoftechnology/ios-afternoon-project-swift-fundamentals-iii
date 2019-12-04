//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currencyType: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let text = fromCurrencyTextField.text else {
            enterANumber()
            return
        }
        convertAndDisplay(text: text)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        self.currencyType = .cad
        sender.isSelected = true
        mxnButton.isSelected = false
        guard let text = fromCurrencyTextField.text else {
            return
        }
        if text != "" {
            convertAndDisplay(text: text)
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        self.currencyType = .mxn
        sender.isSelected = true
        cadButton.isSelected = false
        guard let text = fromCurrencyTextField.text else {
            return
        }
        if text != "" {
            convertAndDisplay(text: text)
        }
    }
    
    // MARK: - Helper Methods    
    // Currency Helper Methods are stored in Model\CurrencyConverter.swift as extensions - enum stored in Model\Globals.swift
    
    // MARK: VC Helper Methods
    //error message when non-number is entered in UITextField
    func enterANumber() {
        fromCurrencyTextField.textColor = .red
        fromCurrencyTextField.text = "Please Enter a Number"
        toCurrencyTextField.text = ""
    }
    //convert Currency and display in text field
    func convertAndDisplay(text: String) {
        fromCurrencyTextField.textColor = .darkText //in case this was set to .red by enterANumber()
        switch self.currencyType {
        case .cad:
            let convertedCurrency = text.toCAD().printAsDollar()
            if convertedCurrency == "$0.00" || convertedCurrency == "error" {
                enterANumber()
            } else {
                self.toCurrencyTextField.text = convertedCurrency
            }
        case .mxn:
            let convertedCurrency = text.toMXN().printAsDollar()
            if convertedCurrency == "$0.00" || convertedCurrency == "error" {
                enterANumber()
            } else {
                self.toCurrencyTextField.text = convertedCurrency
            }
        }
    }
    
}
