//
//  CurrencyConverter.swift
//  CurrencyConverter
//
//  Created by Kenny on 12/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import Foundation

extension String {
    private func toDbl() -> Double {
        guard let toDbl = Double(self) else {
            print("\(self) is not convertible to Double")
            return 0.0
        }
        return toDbl
    }
    
    func toCAD() -> Double {
        let CAD = toDbl() * 1.32
        return CAD
    }
    
    func toMXN() -> Double {
        let MXN = toDbl() * 19.36
        return MXN
    }
}

extension Double {
    func printAsDollar() -> String {
        let currencyConverter = NumberFormatter()
        currencyConverter.numberStyle = .currency
        currencyConverter.currencySymbol = "$"
        guard let currency = currencyConverter.string(from: self as NSNumber) else {return "error"}
        return currency
    }
}
