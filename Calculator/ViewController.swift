//
//  ViewController.swift
//  Calculator
//
//  Created by Krasa on 26/10/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var model: CalculatorModel! // injected
    
        @IBAction func button(_ sender: UIButton) {
        
        let tag = sender.tag
        
        // все цифры в тегах от 1 до 10
        
        if tag >= 1 && tag < 10 {
            model.input(op: .digit(Double(tag)))
        } else if tag == 10 {
            model.input(op: .digit(0))
        } else if tag == 11 {
            model.input(op: .sign)
        } else if tag == 12 {
            model.input(op: .percent)
        } else if tag == 13 {
            model.input(op: .div)
        } else if tag == 14 {
            model.input(op: .mul)
        } else if tag == 15 {
            model.input(op: .minus)
        } else if tag == 16 {
            model.input(op: .plus)
        } else if tag == 18 {
            model.input(op: .point)
        } else if tag == 17 {
            model.input(op: .result)
        } else if tag == 19 {
            model.input(op: .clean)
        }
    }
}

extension ViewController: CalculatorModelOutput {
    func display(string: String) {
        displayLabel.text = string
    }
}
