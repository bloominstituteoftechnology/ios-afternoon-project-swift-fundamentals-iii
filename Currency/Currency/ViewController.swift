//
//  ViewController.swift
//  Currency
//
//  Created by brian vilchez on 7/10/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usCurrencyTexField: UITextField!
    
    @IBOutlet weak var cadCurrencytextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var cadCurrency: UIButton!
    
    @IBOutlet weak var pesoCurrency: UIButton!
    
    @IBAction func ConvertButtonPressed(_ sender: UIButton) {
        
        guard let usCurrencyString = usCurrencyTexField.text,
             let usdCurrency = Double(usCurrencyString)
            else {return}
        
      let currencyExchangeRate = usExchangeRate(usdCurrency)
    
        
        if cadCurrency.isSelected {
             cadCurrencytextField.text = String(currencyExchangeRate.canadianDollar)
           
        } else if pesoCurrency.isSelected {
            currencyLabel.text = "pesos(mex)"
           cadCurrencytextField.text = String(currencyExchangeRate.mexicanPeso)
            }

    }
    
    @IBAction func cadCurrencyButtonPressed(_ sender: UIButton) {
      cadCurrency.isSelected.toggle()
                }
    
    @IBAction func pesoButtonPressed(_ sender: UIButton) {
     pesoCurrency.isSelected.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // helper methods: currency exhange
    func usExchangeRate(_ currency: Double) -> (mexicanPeso:Double,canadianDollar:Double) {
        let usCurrency = currency
        let canadianCurrency = usCurrency / 0.76
        let pesoCurrency = usCurrency / 0.52
        let currencyExchangeRate:(mexicanPeso:Double,canadianDollar:Double) = (pesoCurrency,canadianCurrency)
        return currencyExchangeRate
        
    }
    
   
}

