//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let convertString = fromCurrencyTextField.text else { return }
        
        guard let convertDouble = Double(convertString) else {
        return }
        
        toCurrencyTextField.text = String(convert(dollars: convertDouble))
}
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    enum Currency {
        case cad
        case mxn
    }
    
    var currency : Currency = .cad
    
    func convert(dollars: Double) -> Double {
        let canadianDollars = 0.76 * dollars
        let mxnDollars = 0.05 * dollars
        if currency  == .cad {
           return canadianDollars
        }else{
            return mxnDollars
        }
    
    

    
}


}
