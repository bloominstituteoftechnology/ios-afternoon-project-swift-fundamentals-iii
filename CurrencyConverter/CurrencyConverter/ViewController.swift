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
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
     var currency: Currency = .cad
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
    cadButton.isSelected.toggle()
          mxnButton.isSelected.toggle()
          
          if cadButton.isSelected == true {
          
              currency = .cad
              print(currency)
          }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
            
            if mxnButton.isSelected == true {
                currency = .mxn
                print(currency)
            }
    }
}
    
    // MARK: - Helper Methods

func convert(_ dollars: Double) -> Double {
    
    let convertion = dollars * Currency
    return convertion
}

