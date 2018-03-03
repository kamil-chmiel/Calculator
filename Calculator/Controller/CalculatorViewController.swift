//
//  ViewController.swift
//  Calculator
//
//  Created by Kamil Chmiel on 08.02.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var previousNumber: Double = 0
    var currentNumber: Double = 0
    var sign: Int = -1
    var signAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func deletePressed(_ sender: Any) {
        textLabel.text = "0"
        previousNumber = 0
        currentNumber = 0
        sign = -1
    }

    @IBAction func negativePressed(_ sender: Any) {
        if(!signAdded) {
            currentNumber = -currentNumber
            if(textLabel.text?.first=="-"){
                textLabel.text = String(describing: textLabel.text!.dropFirst())
            }
            else {
                textLabel.text = "-" + textLabel.text!
            }
        }
    }

    @IBAction func operationPressed(_ sender: UIButton) {

        if sign == 1 {
            currentNumber = previousNumber + currentNumber
        }
        else if sign == 2 {
            currentNumber = previousNumber - currentNumber
        }
        else if sign == 3 {
            currentNumber = previousNumber * currentNumber
        }
        else if sign == 4 {
            currentNumber = previousNumber / currentNumber
        }
        else if sign == 5 {
            currentNumber = previousNumber.truncatingRemainder(dividingBy: currentNumber)
        }
    
        switch sender.tag {
        case 0:
            textLabel.text = String(currentNumber)
        case 1:
            textLabel.text = "+"
        case 2:
            textLabel.text = "-"
        case 3:
            textLabel.text = "x"
        case 4:
            textLabel.text = "/"
        case 5:
            textLabel.text = "%"
        default:
            print("Invalid sign pressed")
        }
        previousNumber = currentNumber
        sign = sender.tag
        signAdded = true
    }
    

    @IBAction func digitPressed(_ sender: UIButton) {
        
        var digit: String = ""
        
        if signAdded == true {
            currentNumber = 0
            textLabel.text = ""
            signAdded = false
        }
        
        if sender.tag == 10 && !textLabel.text!.contains(".") {
            if currentNumber == 0 {
                digit = "0."
            }
            else {
                digit = "."
            }
        }
        else {
            if currentNumber == 0 && !textLabel.text!.contains(".") { textLabel.text = "" }
            digit = String(sender.tag)
        }
        
        textLabel.text = textLabel.text! + digit
        currentNumber = Double(textLabel.text!)!
    }
}
