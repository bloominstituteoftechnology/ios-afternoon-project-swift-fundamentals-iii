//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Vici Shaweddy on 7/16/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private enum CurrencyType: String, CaseIterable {
        case cad = "Canadian Dollar (CAD)"
        case peso = "Mexican Peso (MSN)"
        case idr = "Indonesian Rupiah (IDR)"
        case yen = "Japanese Yen (YEN)"
    }
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    private var pickerData: [String] = []
    private var currencyType: CurrencyType = CurrencyType.cad
    {
        didSet {
            // call converter
            self.convertButtonPressed(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        
        // Input the data into the pickerData array
        let showCurrencyType = CurrencyType.allCases.map {$0.rawValue}
        pickerData = showCurrencyType
        
        // Placeholder for toCurrencyTextField
        toCurrencyTextField.placeholder = "$"
        
        // Default keyboard
        fromCurrencyTextField.keyboardType = .numberPad
        fromCurrencyTextField.doneAccessory = true
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let inputString = fromCurrencyTextField.text,
            let inputDouble = Double(inputString) else
        {
            if fromCurrencyTextField.text?.isEmpty == false {
                let alert = UIAlertController(title: "Sorry", message: "Numbers only please!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Gotcha", style: .default, handler:  nil))
                self.present(alert, animated: true)
            }
            
            return
        }
        
        let convertNumber = convert(dollars: inputDouble, to: self.currencyType)
        
        // Adding currency symbols
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        if self.currencyType == .cad || self.currencyType == .peso  {
            numberFormatter.locale = Locale.current
        } else if self.currencyType == .idr {
            numberFormatter.locale = Locale(identifier: "id-ID")
        } else {
            numberFormatter.locale = Locale(identifier: "yue_CN")
        }
       
        toCurrencyTextField.text = numberFormatter.string(from: NSNumber(value: convertNumber))
        
    }
    
    private func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if unit == .cad {
            return 1.35 * dollars
        } else if unit == .peso{
            return 19.78 * dollars
        } else if unit == .idr {
            return 13950.50 * dollars
        } else if unit == .yen {
            return 108.36 * dollars
        } else {
            return 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that is being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Getting the selected value and change the placeholder text filed and label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = pickerData[pickerView.selectedRow(inComponent: 0)]
        
        // change the label to selected currency
        toCurrencyLabel.text = selectedValue
        
        // assign selected value to current type
        self.currencyType = CurrencyType(rawValue: selectedValue) ?? .cad
        
        // change the placeholder for the text field
        if self.currencyType == .cad || self.currencyType == .peso  {
            toCurrencyTextField.placeholder = "$"
        } else if self.currencyType == .idr {
            toCurrencyTextField.placeholder = "Rp"
        } else {
            toCurrencyTextField.placeholder = "¥"
        }
    }
}

extension UITextField {
    @IBInspectable var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}



