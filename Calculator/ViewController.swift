//
//  ViewController.swift
//  Calculator
//
//  Created by ganesh padole on 09/07/1941 Saka.
//  Copyright © 1941 ganesh padole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var isFinishedTypingNumber = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
           fatalError("Cannot convert value to double.")
        }
        
        if let calMethod = sender.currentTitle {
            if calMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calMethod == "%" {
               displayLabel.text = String(number * 0.01)
            } else if calMethod == "AC" {
                displayLabel.text = "0"
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    guard let currentdisplayValue = Double(displayLabel.text!) else {
                        fatalError("conversion not possible")
                    }
                    
                    let isInt = floor(currentdisplayValue) == currentdisplayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }

}

