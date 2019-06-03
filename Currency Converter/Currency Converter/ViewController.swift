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
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let userInput = fromCurrencyTextField.text,
        let userInputDouble = Double(userInput)
        else{ return }
        
        
        
    }
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = CurrencyType.cad
        toCurrencyLabel.text = "Currency (CAD)"
    }
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = CurrencyType.peso
        toCurrencyLabel.text = "Currency (Peso)"
    }
    

}

