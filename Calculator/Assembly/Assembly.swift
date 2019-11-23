//
//  Assembly.swift
//  Calculator
//
//  Created by Krasa on 16/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class CalculatorAssembly {
    var model: CalculatorModel {
        return CalculatorModelImpl()
    }
    
    func calculatorViewController(with model: CalculatorModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "хуй") as! ViewController
        viewController.model = model
        model.output = viewController
        
        return viewController
    }
}
