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
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInput = fromCurrencyTextField.text,
            !userInput.isEmpty,
            let userInputDouble = Double(userInput) else {
                return
        }
        toCurrencyTextField.text = "\(convert(userInputDouble))"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
               if sender.isSelected {
                   currency = .mxn
                   toCurrencyLabel.text = "Currency (MXN)"
               }
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        let cadCurrEx = 1.33
        let mexCurrEx = 19.7
        
        switch(currency) {
        case .cad:
            return dollars * cadCurrEx
        case .mxn:
            return dollars * mexCurrEx
        }
    }
}

