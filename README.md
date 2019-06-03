# Swift Fundamentals III Afternoon Project

Create a Currency Convert app that can convert from US dollars (USD) to Canadian dollars (CAD) and Mexican Pesos (MXN).

Get the currency conversion value from Google:

On June 3rd, 2019 they were:

	$1 USD to $1.35 CAD
	$1 USD to $19.78 CAD

Currency Converter App

![Currency App Converter](images/CurrencyConverter.gif)


## Overview

Design a user interface to take a currency input and convert it into a different currency using the current conversion rates.

## Design the UI

1. US dollar currency 
	1. Add a `UILabel` named "Currency (US)"
	2. Add a `UITextField` for typing US dollars
2. To CAD/MXN dollar currency
	1. Add a `UILabel` named "Currency (CAD)"
	2. Add a `UITextField` for displaying CAD or MXN currency
3. Add a "Convert" `UIButton` below the text fields

### Layout Constraints using Stack Views

You can use Auto Layout constraints and stack views to stretch out the UI to fill in along the top of the iPhone.

1. Embed the USD Currency `UILabel` and `UITextField` into a `UIStackView`
	1. Make the spacing 8
	2. Make the axis horizontal
	3. Make Alignment "Fill"
2. Embed the CAD/MXN Currency `UILabel` and `UITextField` into a `UIStackView`
	1. Make the spacing 8
	2. Make the axis horizontal
	3. Make Alignment "Fill"
3. Select the two stack views and the "Convert" button and embed into a Stack View
	1. Make the spacing 8
	2. Make the axis vertical
	3. Make Alignment "Fill"
4. Align both of the text fields so they are horizontally alixed
	1. Use the "Document Outline" to select both `UITextField` views with the "Option" key
	2. Click the "Alignment constraints" button in the bottom right corner of Storyboard canvas
	3. Click the "Leading Edges" checkbox and then press "Add 1 Constraint"
5. Pin the Vertical Stack view to the top and left and right edges to stretch it out.
	1. Click on the "Add New Constraints" button (square tie fighter button)
	2. Select the I-beams for the leading, top, and trailing constraints
		1. Make it 16 points to the leading and trailing edges
		2. Make it 40 points from the top edge


### Design the CAD / Peso Toggle

Design two buttons to toggle between the two different currencies.

1. Add two `UIButtons` to the center
	1. "CAD" button
	2. "Peso" button
2. Embed both buttons into a Stack View
	3. Make the spacing 8
	4. Make the axis "horizontal"
3. Pin horizontal stack view to the vertical and horizontal center
	4. Click the "Add new Alignment" constraint button
		5. Select both "Horizontally in Container" and "Vertically in Container"
		6. Click "Add 2 Constraints" button


## Add Outlets

You need to add an Outlet so that you can get text or set text in a `UITextField` or toggle a `UIButton`'s selection state.

1. Create an outlet for the US dollar (input) `UITextField` named: `fromCurrenyTextField`
2. Create an outlet for the CAD/MXN (output) `UITextField` named: `toCurrencyTextField`
3. To update the label for the "to" unit, you'll need an outlet for the UILabel.
	1. Create an outlet from the "toCurrencyLabel" so you can change the text of the label when you switch between CAD and Pesos.
2. Add outlets for the button toggles for CAD/Pesos
	3. Create an outlet from the "CAD" button named `cadButton`
	4. Create an outlet from the "Pesos" button named `pesoButton`

## Create Actions

1. You need to calculate the currency conversion rate after a user types in a number and presses the "Calculate" button.
	1. Create an action named: `convertButtonPressed()`
2. You also need to toggle selection state between the "CAD" and "Pesos" buttons.
	3. Create an actions from the "CAD" button named `cadButtonPressed()` 
	4. Create an actions from the "Pesos" button named `pesoButtonPressed()`


## Add the Conversion Logic

1. Create a currency enum

	```swift
	enum CurrencyType {
	    case cad
	    case peso
	}
	```

2. Create a variable to store what CurrencyType the app is in named: `currencyType`
	1. Set the state based on what currency is pressed
3. Create a method to calculate the currency based on the CurrencyType using the method signature:

	```swift
	func convert(dollars: Double, to unit: CurrencyType) -> Double {
	}
	```

4. In the `convertButtonPressed()` action method use a `guard let` to get user input, and convert it to the expected currency
5. Display the currency into the `toCurrencyTextField` 
6. Update the `toCurrencyLabel` based on the state of the currency toggle buttons

Hint: Toggle state on a UIButton with the `myButton.isSelected.toggle()` method.

## Go Further

1. Customize the output display using a `NumberFormatter`

	```swift
	var currencyFormatter: NumberFormatter = {
	    let formatter = NumberFormatter()
	    formatter.numberStyle = .currency
	    return formatter
	}()
	```

2. Use the `string(from:)` method to convert from a number to a String for display

