Created Model Group
    Created CurrencyConverter.swift
        Created extensions
            String
                Convert text to double
                Convert double to the correct currency
            Double
                Convert double back to text formatted as currency
    Created Globals.swift
        Created enum to store currency type (currency)

Changed toTextField to not be editable in storyboard
Created currencyType var in ViewController to hold enum value for current currency type (initial type set to CAD since the initial view is converting to CAD)
Switching currencyType based on which button is pressed (MXN or CAD)
Converting currency based on currencyType
Created Method to display an error message if an empty string or not a number is entered (enterANumber())
