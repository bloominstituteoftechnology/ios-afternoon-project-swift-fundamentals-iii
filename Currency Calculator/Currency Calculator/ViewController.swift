//
//  ViewController.swift
//  Currency Calculator
//
//  Created by Kat Milton on 6/3/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usCurrencyTextField: UITextField!
    @IBOutlet weak var foreignCurrencyTextField: UITextField!
    @IBOutlet weak var foreignCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    // Converts currency to selected foreign currency when 'Convert' button is pressed.
    @IBAction func convertCurrency(_ sender: Any) {
        guard let usdString = usCurrencyTextField.text,
            let usd = Double(usdString) else {
                foreignCurrencyTextField.text = "INVALID INPUT"
                return
        }
        let foreignCurrency = convert(dollars: usd, to: currencyType!)
        foreignCurrencyTextField.text = String(foreignCurrency)
    }
    
    
    // Convert money function.
    func convert(dollars: Double, to unit: CurrencyType) -> Double{
        if cadButton.isSelected {
            let amountInCad = dollars * 1.35
            return amountInCad
        } else if pesoButton.isSelected {
            let amountInPesos = dollars * 19.78
            return amountInPesos
        }
        return 0
    }
    

//Switch currency type
    func switchCurrency() {
        if cadButton.isSelected {
            currencyType = .cad
        } else if pesoButton.isSelected {
            currencyType = .peso
        }
    }
    
// When CAD button is pressed, currency will convert to CAD.
    @IBAction func cadButtonPressed(_ sender: Any) {
        cadButton.isSelected.toggle()
        if pesoButton.isSelected {
            pesoButton.isSelected.toggle()}
        foreignCurrencyLabel.text = "Currency (CAD)"
        switchCurrency()
//        if !pesoButton.isSelected {
//            cadButton.isSelected = true
//        } else {
//            cadButton.isSelected = false
//        }
    }
    
// If peso button is pressed, will convert currency to pesos.
    @IBAction func pesoButtonPressed(_ sender: Any) {
        pesoButton.isSelected.toggle()
        if cadButton.isSelected {
            cadButton.isSelected.toggle()}
        foreignCurrencyLabel.text = "Currency (MXN)"
        switchCurrency()
//        if !cadButton.isSelected {
//            pesoButton.isSelected = true
//        } else {
//            pesoButton.isSelected = false
//        }
    }
    
 
}

