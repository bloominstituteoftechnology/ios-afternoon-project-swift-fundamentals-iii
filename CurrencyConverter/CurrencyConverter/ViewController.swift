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
var currency = Currency.cad

let cadConverter = 1.33
let mxnConverter = 19.70



class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usd = fromCurrencyTextField.text else {
        return
        }
        
        let dollars = Double(usd) ?? 0
        
//        Call currency converter
        let convertedDollars = convert(dollars)
        toCurrencyTextField.text = "$\(convertedDollars)"
        
        
        
        
            
        
        
        
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
//        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        toCurrencyLabel.text = "Currency (CAD)"
        
        currency = .cad
        
            
        }
        
    
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        
        toCurrencyLabel.text = "Currency (MXN)"
        currency = .mxn
        
    }


    
    // MARK: - Helper Methods


    func convert(_ dollars: Double) -> Double
    {
        switch currency {
        case .cad:
            return dollars * cadConverter
        case .mxn:
            return dollars * mxnConverter
        }
    }
        
}

