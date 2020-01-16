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
            
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected = true
        if sender.isSelected == true {
            currency = .cad
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected = false
        if sender.isSelected == true {
                   currency = .mxn
               }
               
           }
    
    // MARK: - Helper Methods

}

