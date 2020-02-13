//
//  Constants.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/12/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

struct K {
    static let apiURL = URL(string: "http://data.fixer.io/api/latest?access_key=182033ad7ea88f501261f7bed00eb64b")!
    static let mainFont = UIFont(name: "ABeeZee-Regular", size: 65)!
    static let tanColor = UIColor(named: "tan")!
    static let greenColor = UIColor(named: "green")!
    
    struct Images {
        static let background = "background"
        static let swapButton = "swapButton"
    }
}
