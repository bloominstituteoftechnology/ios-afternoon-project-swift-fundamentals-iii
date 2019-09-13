//
//  ViewController.swift
//  FundamentalsIII- CurrencyConverter
//
//  Created by Joseph Rogers on 7/15/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //here we are creating our outlets for our textfields and labels.
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    //We linked our UI button to the screen
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pseoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //here we set the currencyType when the view is loaded so it has a state to begin in. We also choose to change the button itself to be in the CAD slot selected slot.
        currencyType = .cad
        cadButton.isSelected = true
        // Do any additional setup after loading the view.
    }
    
    //here we created a variable with the type CurrencyType. Which is an enum we created to represent the differing currencies.
    var currencyType: CurrencyType?
    enum CurrencyType {
        case cad
        case peso
    }
    
    
    
    //created a link to the convert button being pressed
    @IBAction func convertButtonPressed(_ sender: Any) {
        //created a variable called dollars which is equal to what is in the currency fields text field, CASTED as a double. then we are also making sure that the currency type is valid, if so; Execute the code.
        guard let dollars: Double = Double(fromCurrencyTextField.text!),
            let currencyType: CurrencyType = currencyType else {
                return }
        //this is creating a currency formatter.
        let currencyFormat = NumberFormatter()
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = Locale(identifier: "en_US")
        //this is changing the currency text field text to equal our above consatnt,as a string. using the ocnvert function we announced below. this will convert the current value to whichever currency type is selected.
        toCurrencyTextField.text = currencyFormat.string(from: NSNumber(value: convert(dollars: dollars, to: currencyType)))
    }
    @IBAction func cadButtonPressed(_ sender: Any) {
        
        currencyType = .cad
        cadButton.isSelected = true
        pseoButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
        toCurrencyTextField.text = ""
        convertButtonPressed(self)
    }
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = .peso
        pseoButton.isSelected = true
        cadButton.isSelected = false
        toCurrencyLabel.text = "Currency (Peso)"
        toCurrencyTextField.text = ""
         convertButtonPressed(self)
    }


func convert(dollars: Double, to unit: CurrencyType) -> Double {
    let cadPrice: Double = 1.31
    let pesoPrice: Double = 19.10
    switch unit {
    case .cad:
        return dollars * cadPrice
    case .peso:
        return dollars * pesoPrice
    }
}
}
