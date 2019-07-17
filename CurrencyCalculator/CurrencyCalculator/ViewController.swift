//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Lambda_School_Loaner_141 on 7/15/19.
//  Copyright © 2019 Lambda_School_Loaner_141. All rights reserved.
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
        // Do any additional setup after loading the view.
    }
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    
    func convert(_ dollars: Double, to unit: CurrencyType) -> Double {
        var convertedAmount: Double
        if unit == .cad {
            convertedAmount = dollars * 1.35
        } else {
            convertedAmount = dollars * 19.38
        }
        return convertedAmount
    }
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let fromCurrencyString = fromCurrencyTextField.text else {return}
        
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        var convertedAmount: Double
        if cadButton.isSelected {
            convertedAmount = convert(fromCurrency, to: .cad)
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            convertedAmount = convert(fromCurrency, to: .peso)
            toCurrencyLabel.text = "Currency (Peso)"
            pesoButton.isSelected = true
        }
        
        toCurrencyTextField.text = "\(convertedAmount)"
    }
    
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        
        guard let button = sender as? UIButton else {return}
        
        button.isSelected.toggle()
        pesoButton.isSelected = false
        
    }
    
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        
        guard let button = sender as? UIButton else {return}
        
        button.isSelected.toggle()
        cadButton.isSelected = false
    }


}

