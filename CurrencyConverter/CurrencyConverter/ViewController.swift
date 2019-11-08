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

var currency: Currency = .cad
let usdToCad =  1.33
let usdToMxn = 19.70


class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountToConvert = fromCurrencyTextField.text ,
            let dollarAmount = Double(amountToConvert) else {return}
        let win = convert(dollarAmount)
            toCurrencyTextField.text = String(win)
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
    }
}

    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if sender.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
    }
}
        
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {

        switch currency {
        case .cad:
           return dollars * usdToCad
        case .mxn:
            return dollars * usdToMxn
        } // exhausted enum list, no default is needed
    }

}
