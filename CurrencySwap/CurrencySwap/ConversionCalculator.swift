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
    
 
    var latestRatesResult: LatestRatesResult? {
        didSet {
            guard let latestRatesResult = latestRatesResult else { return }
            print(latestRatesResult.rates ?? "")
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    var currencyCodes: [String] {
        return ["USD", "CAD"]
    }
    
    func convert(amount: Double, fromCurrencyCode: String, toCurrencyCode: String) -> Double {
        return 0
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
}
