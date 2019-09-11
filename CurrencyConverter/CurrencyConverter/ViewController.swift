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

var currency: Currency? = .cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        print("Yay you've pressed convert")
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        guard let button = sender as? UIButton else {
            return
        }
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {

        guard let button = sender as? UIButton else {
            return
        }
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Method
    func convertCAD(_ dollars: Double) -> Double {
    let conversion = dollars * 1.31
        return conversion
    }
    
    func convertMXN(_ dollars: Double) -> Double {
        let conversion = dollars * 19.50
        return conversion
}

