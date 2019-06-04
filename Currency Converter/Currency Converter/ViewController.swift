//
//  ViewController.swift
//  Currency Converter
//
//  Created by Jake Connerly on 6/3/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var currencyType: CurrencyType = CurrencyType.cad
    
    //MARK: ConvertButtonTapped
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        guard let userInput = fromCurrencyTextField.text,
        let userInputDouble = Double(userInput)
        else{ return }
        
        if toCurrencyLabel.text == "Currency (CAD)" {
            
            let number: NSNumber = NSNumber(value: convert(dollars: userInputDouble, to: .cad))
            let formattedNumber = currencyFormatter.string(from: number)
            if let unWrappedNumber = formattedNumber {
                toCurrencyTextField.text = unWrappedNumber
            }
          
            
        }else if toCurrencyLabel.text == "Currency (Peso)" {
            let number: NSNumber = NSNumber(value: convert(dollars: userInputDouble, to: .peso))
            let formattedNumber = currencyFormatter.string(from: number)
            if let unWrappedNumber = formattedNumber {
                toCurrencyTextField.text = unWrappedNumber
            }
            

        }
    }
    
    //MARK: cadButtonTapped
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = CurrencyType.cad
        toCurrencyLabel.text = "Currency (CAD)"
        toCurrencyTextField.text = "$"
            cadButton.isSelected = true
            pesoButton.isSelected = false
    }
    
    //MARK: pesoButtonTapped
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = CurrencyType.peso
        toCurrencyLabel.text = "Currency (Peso)"
        toCurrencyTextField.text = "$"
        cadButton.isSelected = false
        pesoButton.isSelected = true
    }
}

