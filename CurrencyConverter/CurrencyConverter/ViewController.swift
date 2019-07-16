//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Fabiola S on 7/15/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

enum CurrencyType {
    case cad
    case mxn
}

class ViewController: UIViewController {

    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var currencyType: CurrencyType = .cad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cadButton.isSelected = true
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        
        var convertedCurrency: Double
        
        if cadButton.isSelected {
            toCurrencyLabel.text = "Currency (CAD)"
            convertedCurrency = convert(dollars: fromCurrency, to: .cad)
        } else {
            toCurrencyLabel.text = "Currency (MXN)"
            convertedCurrency = convert(dollars: fromCurrency, to: .mxn)
        }
        
        toCurrencyTextField.text = "\(currencyFormatter.string(from: NSNumber(value: convertedCurrency)) ?? "No number provided")"
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
        mxnButton.isSelected = false
    }
    
    @IBAction func mxnButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
        cadButton.isSelected = false
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
    
        fromCurrencyTextField.text = ""
        toCurrencyTextField.text = ""
    }
    
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        let convertedDollars: Double
        let cad = 1.35
        let mxn = 19.78
        
        if cadButton.isSelected {
            convertedDollars = dollars * cad
        } else {
            convertedDollars = dollars * mxn
        }
        
        return convertedDollars
    }
    
    var currencyFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency

        return numberFormatter
    }()

}

