//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
}
    // MARK: - Actions
    
    enum Currency {
        case cad
        case mxn
    }
    
    var currency = Currency.cad

    
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let converButtonTapped = sender as? UIButton else { return }
        converButtonTapped.isSelected.toggle()
        
        guard let dollars: Double = Double(fromCurrencyTextField.text!),
            let currencyType: Currency = currency else { return }
        
        var currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()
        
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convert(_dollars: dollars)))
    }
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        guard let mxnButtonTapped = sender as? UIButton else { return }
        mxnButtonTapped.isSelected.toggle()
        
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let toCurrencyString = toCurrencyTextField.text else { return }
        
        guard let amountEntered = Double(fromCurrencyString),
            let amountEntered2 = Double(toCurrencyString) else {
                print("Invalid number")
                return
        }
        var amountToConvert: Double
        
        if mxnButton.isSelected {
            var mxCurrency = Currency.mxn
            mxnButton.isSelected = true
            cadButton.isSelected = false
            print("\(toCurrencyLabel) Currency (MXN)")
        }
    }
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        guard let cadButtonTapped = sender as? UIButton else { return }
        cadButtonTapped.isSelected.toggle()
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let toCurrencyString = toCurrencyTextField.text else { return }
        
        guard let amountEntered = Double(fromCurrencyString),
            let amountEntered2 = Double(toCurrencyString) else {
                print("Invalid number")
                return
        }
        
        var amountToConvert: Double
        
        if cadButton.isSelected {
            var cadCurrency = Currency.cad
            cadButton.isSelected = true
            mxnButton.isSelected = false
            print("\(toCurrencyLabel) Currency (CAD)")
            
        }
   
    }
    
    // MARK: - Helper Methods
    
    func convert(_dollars: Double) -> Double {
        let cadDollar = Double(1.32)
        let usDollar = Double(1.00)
        let mxnPeso = Double(19.10)
    
        if cadButton.isSelected == true  {
        var amountToConvert = usDollar * cadDollar
            return amountToConvert
            
        } else {
            mxnButton.isSelected == true
            var amountToConvert = usDollar * mxnPeso
            return amountToConvert
        }
    }


}


