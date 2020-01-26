//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jarren Campos on 01/24/20
//  Copyright © 2019 Lambda School. All rights reserved.
//  edited

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
        guard let userInputString = fromCurrencyTextField.text else { return }
        guard var userInput = Double(userInputString)
            else{
                print("Invalid Number")
                return
        }
        userInput = convert(userInput)
        toCurrencyTextField.text = "\(userInput)"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
//        guard let button = sender as? UIButton else { return }
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if (cadButton.isSelected == true){
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
//        guard let button = sender as? UIButton else { return }
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        if (mxnButton.isSelected == true){
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        if currency == .cad {
            let answer = dollars * 1.31
            return answer
        }
        else if currency == .mxn{
            let answer = dollars * 18.78
            return answer
        } else { return 0 }
    }
}


