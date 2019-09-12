//
//  ViewController.swift
//  iOS-Afternoon-Project-Swift-Fundamentals-III-Currency-Converter
//
//  Created by Blake Andrew Price on 9/10/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    
    // The currency formatter takes a number and returns it as a string
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    enum CurrencyType {
        case cad
        case peso
    }
    // Convert function: takes a Double and the CurrencyType and returns a Double that is the amount of USD converted to CAD/MXN
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        let money: Double = dollars
        var conversion: Double = 0
        
        switch unit {
        case .cad:
            conversion = money * 1.35
        case .peso:
            conversion = money * 19.78
        }
        return conversion
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // When the convert button is pressed
    @IBAction func convertButtonPressed(_ sender: Any) {
    // take the text field from the input
        guard let usdTextFieldInput = fromCurrencyTextField.text,
    // turn the string into a double
            let usdAmount = Double(usdTextFieldInput) else { return }
        
        var convertedAmount: Double = 0
    // if the peso currency is selected
                if pesoButton.isSelected == true {
    // convert that amount into pesos
            convertedAmount = convert(dollars: usdAmount, to: .peso)
    // else if the currency cad is selected convert into cad
        } else if cadButton.isSelected == true {
            convertedAmount = convert(dollars: usdAmount, to: .cad)
        }
    // store that amount in convertedAmount and pass it to the currency formatter
        let currencyToString = currencyFormatter.string(from: NSNumber(value: convertedAmount))
    // set the output text field to the converted currency in correct format
        toCurrencyTextField.text = "\(currencyToString ?? "")"
    }
    
    // MARK: - Helper Functions
    // when a currency button is pressed, it will toggle that button while untoggling the other currency button while changing the currency label to the selected currency
    @IBAction func cadButtonPressed(_ sender: UIButton) {
        
        if sender == pesoButton{
            pesoButton.isSelected = true
            cadButton.isSelected = false
            toCurrencyLabel.text = "Currency (MXN)"
        } else if sender == cadButton{
            pesoButton.isSelected = false
            cadButton.isSelected = true
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func pesoButtonPressed(_ sender: UIButton) {
        if sender == pesoButton{
            pesoButton.isSelected = true
            cadButton.isSelected = false
            toCurrencyLabel.text = "Currency (MXN)"
        } else if sender == cadButton{
            pesoButton.isSelected = false
            cadButton.isSelected = true
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    
    
}

