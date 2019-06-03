//
//  currencyType.swift
//  Currency Converter
//
//  Created by Jake Connerly on 6/3/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

let CADConversion: Double = 1.35
let PesoConversion: Double = 19.78
var conversionResult: Double = 0.0

enum CurrencyType {
    case cad
    case peso
}

func convert(dollars: Double, to unit: CurrencyType) -> Double {
    if unit == CurrencyType.cad {
        conversionResult = dollars * CADConversion
    } else if unit == CurrencyType.peso {
        conversionResult = dollars * PesoConversion
    }
   
    return conversionResult
}
