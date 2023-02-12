//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Edwin Cardenas on 2/11/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    private var number: Double?
    private var intermediateCalculation: (number1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(number2: n)
            default:
                intermediateCalculation = (number1: n, calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(number2: Double) -> Double? {
        if let number1 = intermediateCalculation?.number1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "÷":
                return number1 / number2
            case "×":
                return number1 * number2
            default:
                fatalError("Operation not allowed.")
            }
        }
        
        return nil
    }
}
