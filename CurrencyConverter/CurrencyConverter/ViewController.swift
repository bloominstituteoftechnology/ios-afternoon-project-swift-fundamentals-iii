//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: String {
    case cad
    case mxn
}

class ViewController: UIViewController {

    var currency: Currency = .cad
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputString = fromCurrencyTextField.text else { return }
        guard let dollars = Double(inputString) else { return }
        let convertedAmount = convert(dollars)
        toCurrencyTextField.text = format(convertedAmount)
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
        case .cad:
            return dollars * 1.31
        case .mxn:
            return dollars * 18.70
        }
    }

    func format(_ amount: Double) -> String {
        currencyFormatter.currencyCode = currency.rawValue
        return currencyFormatter.string(from: NSNumber(value: amount)) ?? ""
    }
}

