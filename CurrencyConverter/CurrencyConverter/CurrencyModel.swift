//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by brian vilchez on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum CurrencyType: Double {
    case CAD = 0.75
    case MXPeso = 0.05
}

class Currency {
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    func ConvertToCAD(from: Double, to currency: CurrencyType) -> String {
            let currencyExchangeRate = from / currency.rawValue
        let amountInString = currencyFormatter.string(from: NSNumber(value: Int(currencyExchangeRate))) ?? ""
        return amountInString
    }
    
    func convertToPeso(from: Double, to currency: CurrencyType) -> String {
        let currencyExchangeRate = from / currency.rawValue
      let amountInString = currencyFormatter.string(from: NSNumber(value: Int(currencyExchangeRate))) ?? ""
        return amountInString
    }
}
