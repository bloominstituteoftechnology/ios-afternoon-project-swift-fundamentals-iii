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
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
//        guard let fromCurrencyText = fromCurrencyTextField.text else { return }
//        guard let fromCurrencyField = Double(fromCurrencyText) else {
//            print("An invalid number was entered.")
//            return }
//
//        convert(fromCurrencyField)
//
//        let nsCurrency = NSNumber(value: convert(fromCurrencyField))
//        let formattedCurrency1 = currencyFormatter.string(from: nsCurrency)
//        guard let formattedCurrency2 = formattedCurrency1 else { return }
//        toCurrencyTextField.text = String(formattedCurrency2)
        conversionProcess()
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        conversionProcess()
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if sender.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
        conversionProcess()
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var peso: Double
        var canadianDollar: Double
        let convertedCurrency: Double
        
        if currency == .cad {
            canadianDollar = dollars * 1.33
            convertedCurrency = canadianDollar
        } else {
            peso = dollars * 19.70
            convertedCurrency = peso
        }
        return convertedCurrency
    }
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    func conversionProcess() {
        guard let fromCurrencyText = fromCurrencyTextField.text else { return }
        guard let fromCurrencyField = Double(fromCurrencyText) else {
            print("An invalid number was entered.")
            return }
        
        convert(fromCurrencyField)
        
        let nsCurrency = NSNumber(value: convert(fromCurrencyField))
        let formattedCurrency1 = currencyFormatter.string(from: nsCurrency)
        guard let formattedCurrency2 = formattedCurrency1 else { return }
        toCurrencyTextField.text = String(formattedCurrency2)
    }
  
    
}

