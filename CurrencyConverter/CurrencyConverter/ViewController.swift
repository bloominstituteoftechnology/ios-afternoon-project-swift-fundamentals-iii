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
var currency: Currency?

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let dollars = fromCurrencyTextField.text,
        let dollarString = Double(dollars) else {
            return
        }
        let usDollars = convertUSD(dollarString)
        toCurrencyTextField.text = ("$ \(usDollars)")
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        currency = .cad
        cadButton.isSelected = true
        mxnButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
    
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        currency = .mxn
        cadButton.isSelected = false
        mxnButton.isSelected = true
        toCurrencyLabel.text = "Currency (MXN)"
    }
    
    // MARK: - Helper Methods
//    func convert(_dollars: Double) -> Double {
//        return
//    }

//    func convertMXN(_dollars: Double, to unit: Currency) -> Double {
//        let currencyInPesos = _dollars * 17.42
//        let currencyInCAD = _dollars * 1.17
//
////        switch unit {
////        case .cad:
////            return _dollars * currencyInCAD
////        case .mxn:
////            return _dollars * currencyInPesos
////        }
////    }
////

    func convertUSD(_ dollars: Double) -> Double {
        if currency == .cad {
            let cadRate = 1.17
            let currencyInCAD = cadRate * dollars
            return currencyInCAD
        }
        else {
            let mxnRate = 17.42
            let currencyInPesos = mxnRate * dollars
            return currencyInPesos
        }


}
}
