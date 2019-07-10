//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jeffrey Santana on 7/10/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - IBOutlets

	@IBOutlet weak var fromCurrencyTextField: UITextField!
	@IBOutlet weak var toCurrencyTextField: UITextField!
	@IBOutlet weak var toCurrencyLbl: UILabel!
	
	
	//MARK: - Properties
	private enum CurrencyType: String {
		case USD
		case CAD
		case MXN
	}
	
	private var currencyType = CurrencyType.CAD
	
	var currencyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		return formatter
	}()
	
	//MARK: - IBActions

	@IBAction func convertBtnAction(_ sender: Any) {
		guard let usCurrencyString = fromCurrencyTextField.text else { return }
		
		let originCurrency =  validateAmount(amountString: usCurrencyString)
		let convertedAmount = convertCurrency(amount: originCurrency)
		
		toCurrencyTextField.text = currencyFormatter.string(from: convertedAmount)
		fromCurrencyTextField.text = currencyFormatter.string(from: originCurrency as NSNumber)
		
		updateCurrencyLbl()
	}
	
	@IBAction func currencySegControlAction(_ sender: UISegmentedControl) {
		switch sender.titleForSegment(at: sender.selectedSegmentIndex) {
		case CurrencyType.CAD.rawValue:
			currencyType = .CAD
		case CurrencyType.MXN.rawValue:
			currencyType = .MXN
		default:
			currencyType = .USD
		}
		
	}
	
	//MARK: - Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fromCurrencyTextField.delegate = self
	}
	
	private func convertCurrency(amount: Double) -> NSNumber {
		var exchangeRate = 0.0
		switch currencyType {
		case .CAD:
			exchangeRate = 1.31
		case .MXN:
			exchangeRate = 19.18
		default:
			break
		}
		
		return NSNumber(value: amount * exchangeRate)
	}
	
	private func updateCurrencyLbl() {
		toCurrencyLbl.text = "Currency (\(currencyType.rawValue))"
	}
	
	private func validateAmount(amountString: String) -> Double {
		if let amount = Double(amountString) {
			return amount
		} else if let amount = currencyFormatter.number(from: amountString) as? Double {
			return Double(amount)
		}
		return 0
	}
}

extension ViewController: UITextFieldDelegate {
	
	//Prevent non-numerical input. Got off web
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let allowedCharacters = CharacterSet(charactersIn:"0123456789.")
		let characterSet = CharacterSet(charactersIn: string)
		return allowedCharacters.isSuperset(of: characterSet)
	}
}
