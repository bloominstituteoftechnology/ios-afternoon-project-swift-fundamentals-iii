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

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        
        sender.isSelected.toggle()
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
                // toggle the mxnButton off
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
//            currency = cadCurrencyRate * 1.32
//
//        } else {
//            return
     }

        toCurrencyLabel.text = "Currency (CAD)"
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
    
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            
        toCurrencyTextField.text = "Currency (MXN)"
    }
        }
        
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
       
        
    }
}

