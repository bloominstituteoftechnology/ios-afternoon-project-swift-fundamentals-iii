//
//  ViewController.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/11/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    let conversionCalculator = ConversionCalculator()
    
    var inputCurrencyCode = "USD" {
        didSet {
            inputCurrencyButton.setTitle(inputCurrencyCode, for: .normal)
            inputCurrencySymbolLabel.text = NumberFormatter.shortestSymbolForCurrencyCode(inputCurrencyCode)
        }
    }
    var outputCurrencyCode = "EUR" {
        didSet {
            outputCurrencyButton.setTitle(outputCurrencyCode, for: .normal)
            outputCurrencyFormatter.currencySymbol = NumberFormatter.shortestSymbolForCurrencyCode(outputCurrencyCode)
        }
    }
    
    let outputCurrencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.currencySymbol = NumberFormatter.shortestSymbolForCurrencyCode("EUR")
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
    
    lazy var keyboardDismisser: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = view.frame.size
        scrollView.keyboardDismissMode = .interactive
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

//MARK: - Subviews
    
    let backgroundImageView = UIImageView(image: UIImage(named: K.Images.background))
    
    let swapButton: UIButton = {
        let swapButton = UIButton()
        swapButton.setImage(UIImage(named: K.Images.swapButton), for: .normal)
        swapButton.addTarget(self, action: #selector(swapButtonPressed), for: .touchUpInside)
        return swapButton
    }()
    
    let inputCurrencyButton = UIButton(title: "USD", titleColor: K.tanColor, font: K.mainFont, target: self, action: #selector(currencyButtonPressed(_:)))
    lazy var inputValueTextField: UITextField = {
        let textField = UITextField(placeholder: "", font: K.mainFont, color: K.tanColor, keyboardType: .numberPad, inputAccessoryView: nil)
        textField.textAlignment = .center
        textField.leftView = inputCurrencySymbolLabel
        textField.text = "1.00"
        textField.leftViewMode = .unlessEditing
        textField.clearsOnBeginEditing = true
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }()
    let inputCurrencySymbolLabel: UILabel = {
        let symbol = UILabel()
        symbol.text = "$"
        symbol.font = K.mainFont
        symbol.textColor = K.tanColor
        return symbol
    }()
    let outputCurrencyButton = UIButton(title: "EUR", titleColor: K.greenColor, font: K.mainFont, target: self, action: #selector(currencyButtonPressed(_:)))
    let outputValueTextField: UITextField = {
        let textField = UITextField(placeholder: "", font: K.mainFont, color: K.greenColor, keyboardType: .numberPad, inputAccessoryView: nil)
        textField.text = "€0.92"
        return textField
    }()
//MARK: - Actions
    
    @objc func swapButtonPressed() {
        (inputCurrencyCode, outputCurrencyCode) = (outputCurrencyCode, inputCurrencyCode)
        calculateConversion()
    }
    
    @objc func currencyButtonPressed(_ button: UIButton) {
        let currencyTableViewController = CurrencyTableViewController()
        
        currencyTableViewController.currencyCodes = conversionCalculator.currencyCodes
        
        currencyTableViewController.selectionHandler = { [weak self] currencyCode in
            if button == self?.inputCurrencyButton {
                self?.inputCurrencyCode = currencyCode
            } else {
                self?.outputCurrencyCode = currencyCode
            }
            self?.calculateConversion()
        }
        
        self.present(currencyTableViewController, animated: true, completion: nil)
    }

//MARK: - Methods
    
    func calculateConversion() {
        guard let text = inputValueTextField.text, let inputAmount = Double(text) else { return }
        
        let result = conversionCalculator.convert(amount: inputAmount, fromCurrencyCode: inputCurrencyCode, toCurrencyCode: outputCurrencyCode)
        outputValueTextField.text = outputCurrencyFormatter.string(from: NSNumber(value: result))
    }
    
//MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputValueTextField.delegate = self
        outputValueTextField.isUserInteractionEnabled = false
     
        layoutViews()
    }
    
    func layoutViews() {
        view.addSubview(keyboardDismisser)
        keyboardDismisser.fillSuperview()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperview()
        
        view.addSubview(swapButton)
        swapButton.centerHorizontally().centerVertically()
        
        let topStack = UIStackView(arrangedSubviews: [inputCurrencyButton, inputValueTextField])
        view.addSubview(topStack)
        topStack.fillHorizontally().centerVertically(multiplier: 0.4)
        topStack.axis = .vertical
        topStack.alignment = .center
        
        let bottomStack = UIStackView(arrangedSubviews: [outputCurrencyButton, outputValueTextField])
        view.addSubview(bottomStack)
        bottomStack.fillHorizontally().centerVertically(multiplier: 1.6)
        bottomStack.axis = .vertical
        bottomStack.alignment = .center
    }
}

//MARK: - UITextFieldDelegate

extension ConversionViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        calculateConversion()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculateConversion()
        textField.endEditing(true)
        
        return true
    }
}



