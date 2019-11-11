//
//  ViewController.swift
//  currencyConverter
//
//  Created by xcode Mojave on 11/8/19.
//  Copyright © 2019 xcode Mojave. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}

let usd = 1
var cad: Double = 1.33
var mxn: Double = 19.70

//Create a property named currency of type Currency. This will store the current currency type we'll be converting to. Set an initial value of .cad.


class ViewController: UIViewController {

    let currency: Currency = .cad
    // IB Outlets
    
    @IBOutlet weak var currencyPesoLbl: UILabel!
    
    @IBOutlet weak var usdCurrencyTxtField: UITextField!
    
    @IBOutlet weak var pesoCadCurrencyTextField: UITextField!
    
    @IBOutlet weak var pesoBtn: UIButton!
    @IBOutlet weak var cdnBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // IB actions
//    In the convertButtonTapped() action method:
//    use a guard let to get user input
//    convert the dollar amount to the expected currency (hint, you'll want to call the convert method you created in step 5)
//    Update the toCurrencyTextField.text property with the converted currency value
//
    @IBAction func converBtnPressed(_ sender: Any) {
        guard let convertedString = usdCurrencyTxtField.text else { return }
        guard let converted = Double(convertedString) else {
            print("Invalid Amount. Please enter a valid amount")
            return
        }
        let finalConvertd = convert(converted)
        pesoCadCurrencyTextField.text = "\(finalConvertd)"
        
    }
    
//    In the cadButtonTapped action: Toggle this button's isSelected state
//    Toggle the mxn button's isSelected state
//    Check this button's state, and if true:
//    set the currency property to .cad
//    Display the currency in the toCurrencyLabel (so have it say "Currency (CAD)")
//    var selected = true
    @IBAction func cadBtnPressed(_ sender: Any) {
        cdnBtn.isSelected.toggle()
        if cdnBtn.isSelected {
        pesoBtn.isSelected = false
        Currency.cad
        currencyPesoLbl.text = "Currency (CAD)"
        }
    }
    
    @IBAction func pesoBtnPressed(_ sender: Any) {
        pesoBtn.isSelected.toggle()
        if pesoBtn.isSelected {
        Currency.mxn
        cdnBtn.isSelected = false
        currencyPesoLbl.text = "Currency (MXN)"
        }

  }
    
    //Helper Function
    
    func convert(_ dollars: Double) -> Double {
        let cConversion: Double
        if currency == .cad {
            cConversion = dollars * 1.33
        } else {
            cConversion = dollars * 19.70
        }
        return cConversion
}
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

}
