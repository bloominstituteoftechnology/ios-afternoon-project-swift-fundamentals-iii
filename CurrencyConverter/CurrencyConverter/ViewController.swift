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
    
    // TODO: implement currencyButton type?
    // TODO: implement dict of currencyButtons
    //var currencyButtons: [Currency : UIButton] = [:]
    var conversionRates: [Currency : Double] = [
        .cad : 1.33,
        .mxn : 19.78
    ]
    var currency: Currency = .cad
    let currencyLabelPrefix = "Currency"

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromAmountText = fromCurrencyTextField.text else {
            print("ERROR: invalid 'from' text")
            return
        }
        guard let fromAmount = Double(fromAmountText) else {
            print("ERROR: invalid 'from' amount")
            return
        }
        let toAmount = convert(fromAmount)
        
        toCurrencyTextField.text = String(toAmount)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected = !cadButton.isSelected // ensure that other button is opposite
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "\(currencyLabelPrefix) (\(currency.rawValue))"
        }
        
        convertButtonTapped(cadButton) // automatically convert when currency changed
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected = !mxnButton.isSelected // ensure that other button is opposite
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "\(currencyLabelPrefix) (\(currency.rawValue))"
        }
        
        convertButtonTapped(mxnButton)
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        guard let conversionRate = conversionRates[currency] else {
            print("ERROR: currency conversion rate is invalid")
            return 0
        }
        return dollars * conversionRate
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
    
    // TODO: make generic `currencyButtonTapped` func
//    func toggleCurrency(_ sender: UIButton) {
//
//    }
}

