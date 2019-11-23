//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Krasa on 16/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

protocol CalculatorModel: class {
    var output: CalculatorModelOutput? { get set }
    func input(op: Operation)
}
