//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency : String {
    case cad = "CAD"
    case mxn = "MXN"
}

// TODO: implement `CurrencyButton : UIButton` type?

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
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromAmountText = fromCurrencyTextField.text else {
            print("ERROR: invalid 'from' text")
            return
        }
        let fromAmountDoubleText: String = {
            let text = fromAmountText.replacingOccurrences(of: "$", with: "")
            return text.replacingOccurrences(of: ",", with: "")
        }()
        guard let fromAmount = Double(fromAmountDoubleText) else {
            print("ERROR: invalid 'from' amount")
            return
        }
        let toAmount = convert(fromAmount)
        
        fromCurrencyTextField.text = currencyFormatter.string(from: fromAmount as NSNumber)
        toCurrencyTextField.text = currencyFormatter.string(from: toAmount as NSNumber)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        switchCurrency(sender)
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        switchCurrency(sender)
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        guard let conversionRate = conversionRates[currency] else {
            print("ERROR: currency conversion rate is invalid")
            return 0
        }
        return dollars * conversionRate
    }
    
    func switchCurrency(_ sender: UIButton) {
        sender.isSelected = true
        for button in currencyButtons {
            if button.key == sender {
                currency = button.value
                toCurrencyLabel.text = "\(currencyLabelPrefix) (\(currency.rawValue))"
            } else {
                button.key.isSelected = false
            }
        }
        print("current currency: \(currency.rawValue)")
        convertButtonTapped(sender)
    }
    
    // TODO: get all currency buttons programatically rather than explicitly
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populate currencyButtons dict for currency switching
        currencyButtons = [
            cadButton : .cad,
            mxnButton : .mxn
        ]
    }
}

