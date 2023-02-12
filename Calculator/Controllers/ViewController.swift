//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator = CalculatorModel()
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Cannot convert display label text to a Double.") }
            
            return number
        }
        
        set {
            let decimalPlaces = String(newValue).components(separatedBy: ".")
            
            if decimalPlaces.last == "0" {
                displayLabel.text = String(decimalPlaces.first!)
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                if number == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = number
                }
                
                isFinishedTypingNumber = false
            } else {
                if number == "." && displayLabel.text!.contains(".") {
                    return
                    
                } else {
                    displayLabel.text?.append(number)
                }
            }
        }
    
    }

}

