//
//  ConversionCalculator.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/12/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation
import Combine

struct LatestRatesResult: Decodable {
     let rates: [String: Double]?
 }
 
class ConversionCalculator {
    
    var latestRatesResult: LatestRatesResult?
    
    var subscriptions = Set<AnyCancellable>()
    
    var currencyCodes: [String] {
        guard let rates = latestRatesResult?.rates else { return [] }
        return rates.keys.sorted()
    }
    
    init() {
        self.fetchLatestRates()
    }
    
    func fetchLatestRates() {
        URLSession.shared.dataTaskPublisher(for: K.apiURL)
            .retry(1)
            .map(\.data)
            .decode(type: LatestRatesResult.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { value in
                self.latestRatesResult = value
            })
            .store(in: &subscriptions)
    }
    
    func convert(amount: Double, fromCurrencyCode inputCode: String, toCurrencyCode outputCode: String) -> Double {
        guard let rates = latestRatesResult?.rates else { return 0 }
        guard let inputRate = rates[inputCode], let outputRate = rates[outputCode] else { return 0 }
        return amount / inputRate * outputRate
    }
}
