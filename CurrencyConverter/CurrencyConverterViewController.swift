//
//  CurrencyConverterViewController.swift
//  CurrencyConverter
//
//  Created by Steven Leyva on 7/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        guard let currencyString = fromCurrencyTextField.text,
            let currencyAmount = Double(currencyString) else { return }
       
        let result = convert(dollars: currencyAmount , to: currencyType)
        
        toCurrencyTextField.text = "\(result)"
        
        
        
    }
    
    @IBAction func cadButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        if pesoButton.isSelected {
            pesoButton.isSelected.toggle()
        }
        toCurrencyLabel.text = "Currency (CAD)"
        currencyType = .cad
        
    }
    
    @IBAction func pesoButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        if cadButton.isSelected {
            cadButton.isSelected.toggle()
        }
        toCurrencyLabel.text = "Currency (Peso)"
        currencyType = .peso
        
    }
    var currencyType: CurrencyType = .cad
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        // get the dollar amount to cad
        let canadianAmount = 1.31 * dollars
        if unit == .cad {
            return canadianAmount
        } else {
            let pesoAmount = 19.15 * dollars
            return pesoAmount
            
        }
        
    }
}

enum CurrencyType {
    case cad
    case peso
}





