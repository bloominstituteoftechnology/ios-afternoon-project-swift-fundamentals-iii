//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// TODO: refactor/implement API for adding further currencies
enum Currency : String {
    case cad = "CAD"
    case mxn = "MXN"
}

// TODO: implement `CurrencyButton : UIButton` class?

class ViewController: UIViewController {
    //: as of 2019-10-02 12:14 PDT:
    //:
    //: - 1 USD =  1.33 CAD
    //: - 1 USD = 19.78 MXN
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currencyButtons: [UIButton : Currency] = [:]
    var conversionRates: [Currency : Double] = [
        .cad : 1.33,
        .mxn : 19.78
    ]
    var currency: Currency = .cad
    
    let currencyLabelPrefix = "Currency"
    // TODO: implement possibility for different currency types into formatter
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        convertInputTextToCurrency()
    }
    
    // both buttons do almost exactly the same thing, so it makes sense to use one function for both of them
    @IBAction func currencyButtonTapped(_ sender: UIButton) {
        sender.isSelected = true
        for button in currencyButtons {
            if button.key == sender {
                currency = button.value
                toCurrencyLabel.text = "\(currencyLabelPrefix) (\(currency.rawValue))"
            } else {
                button.key.isSelected = false
            }
        }
        //print("current currency: \(currency.rawValue)")
        convertInputTextToCurrency()
    }
    
    // MARK: - Helper Methods
    
    func convertInputTextToCurrency() {
        let fromAmount = convertCurrencyTextToDouble(text: fromCurrencyTextField.text)
        
        // convert usd to current currency
        let toAmount = convertCurrency(fromAmount)
        
        // display field text as currency
        fromCurrencyTextField.text = currencyFormatter.string(from: fromAmount as NSNumber)
        toCurrencyTextField.text = currencyFormatter.string(from: toAmount as NSNumber)
    }
    
    func convertCurrencyTextToDouble(text: String?) -> Double {
        // do nothing if invalid text
        guard var newText = text else {
            print("ERROR: invalid 'from' text")
            return 0
        }
        
        // strip currency formatting
        newText = newText.replacingOccurrences(of: "$", with: "")
        newText = newText.replacingOccurrences(of: ",", with: "")
        
        // do nothing if invalid amount
        guard let doubleFromString = Double(newText) else {
            print("ERROR: invalid 'from' amount")
            return 0
        }
        
        return doubleFromString
    }
    
    func convertCurrency(_ dollars: Double) -> Double {
        guard let conversionRate = conversionRates[currency] else {
            print("ERROR: currency conversion rate is invalid")
            return 0
        }
        return dollars * conversionRate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populate currencyButtons dict (for currency switching) once view is loaded
        currencyButtons = [
            cadButton : .cad,
            mxnButton : .mxn
        ]
        // TODO: get all currency buttons programatically rather than explicitly
    }
}

