//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Dillon P on 7/15/19.
//  Copyright © 2019 Dillon P. All rights reserved.
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
        
        cadButton.isSelected = true
        // Do any additional setup after loading the view.
    }
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        var amount: Double
        if unit == .peso {
            amount = dollars * 19.1
        } else {
            amount = dollars * 1.31
        }
        return amount
    }
    
    func makeCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: amount))  ?? "Please try again"
    }
    

    @IBAction func convertButtonPressed(_ sender: Any) {
        
        guard let currencyString = fromCurrencyTextField.text else { return }
        
        guard let currencyAmount = Double(currencyString) else {
            print("Please insert a valid number!")
            return
        }
        
        if cadButton.isSelected {
            currencyType = .cad
        } else {
            currencyType = .peso
        }
        
        let convertedAmount = convert(dollars: currencyAmount, to: currencyType)
        let convertedCurrency = makeCurrency(amount: convertedAmount)
        toCurrencyTextField.text = "\(convertedCurrency)"
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        guard let cadButton = sender as? UIButton else { return }
        cadButton.isSelected.toggle()
        pesoButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
        convertButtonPressed(sender)
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        guard let pesoButton = sender as? UIButton else { return }
        pesoButton.isSelected.toggle()
        cadButton.isSelected = false
        toCurrencyLabel.text = "Currency (MXN)"
        convertButtonPressed(sender)
    }
    
    
}

