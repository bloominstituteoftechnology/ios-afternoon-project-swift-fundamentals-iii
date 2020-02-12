//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: String {
    case cad = "CAD"
    case mxn = "Peso"
    
    var conversionRate: Double {
        switch self {
        case .cad:
            return 1.33
        case .mxn:
            return 18.64
        }
    }
    
    var locale: Locale {
        switch self {
        case .cad:
            return .init(identifier: "en_CA")
        case .mxn:
            return .init(identifier: "es_MX")
        }
    }
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currencyFormatter: NumberFormatter = {
        var currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
    
    var currency = Currency.cad {
        didSet {
            currencyFormatter.locale = currency.locale
        }
    }
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputString = fromCurrencyTextField.text, let inputAmount = Double(inputString) else {
            return
        }
        
        let convertedAmount = convert(inputAmount)
        let formattedAmount = currencyFormatter.string(from: NSNumber(value: convertedAmount))
        
        toCurrencyTextField.text = "\(formattedAmount ?? "")"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        toggleCurrency()
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        toggleCurrency()
    }
    
    // MARK: - Helper Methods
    
    func toggleCurrency() {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        currency = cadButton.isSelected ? .cad : .mxn
        toCurrencyLabel.text = "Currency: (\(currency.rawValue))"
        
        // If toggling, we should also either clear the toCurrencyTextField or re-convert
        // Since there is an explicit "Convert" button, I chose to clear the toCurrencyTextField
        // This prevents showing a converted amount that doesn't line up with the currency shown
        toCurrencyTextField.text = ""
    }
    
    func convert(_ dollars: Double) -> Double {
        dollars * currency.conversionRate
    }
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        // We aren't allowing conversion from the toCurrencyTextField currently, so let's disable it
        toCurrencyTextField.isEnabled = false
        // Changing the keyboard type to decimal pad makes typing in numbers easier
        fromCurrencyTextField.keyboardType = .decimalPad
    }
}

