//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Cannot convert display label text to a Double.") }
            
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayValue = 0
            } else if calcMethod == "%" {
                displayValue /= 100
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

