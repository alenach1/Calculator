//
//  CalculatorModelImpl.swift
//  Calculator
//
//  Created by Krasa on 16/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Krasa on 09/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

protocol CalculatorModelOutput {
    func display(string: String)
}

enum Operation {
    case digit(Double)
    case plus
    case minus
    case mul
    case div
    case sign
    case percent
    case result
    case clean
}

enum InternalState {
    case initial
    case input(Double)
    case mathOperation(Operation)
    case result
    case clean
    case point
}

class CalculatorModelImpl: CalculatorModel {
    var firstNum: Double = 0
    var secondNum: Double = 0
    
    var result: Double = 0
    var display: String = ""
    private var prevState: InternalState = .initial
    
    
    var output: CalculatorModelOutput?
    
    func input(op: Operation) {
        let internalState = newInternalState(op)
        processWith(state: internalState)
        
    }
}

private extension CalculatorModelImpl {
    func processWith(state: InternalState) {
        switch state {
        case .input(let value):
            switch prevState { //предыдущее состояние
            case .input, .initial, .clean, .result:
                firstNum = firstNum * 10 + value
                output?.display(string: String(firstNum))
            case .point:
                if firstNum != 0 {
                firstNum = firstNum * 0.1 + value
                    output?.display(string: String(firstNum))
                } else {
                    secondNum = secondNum * 0.1 + value
                    output?.display(string: String(secondNum))
                }
            case .mathOperation(_):
                secondNum = secondNum * 10 + value
                output?.display(string: String(secondNum))
            }
            break
        case .mathOperation(_):
            switch prevState {
            case .clean, .initial, .result:
                break
            case .point:
                break
            case .input(let value):
                    firstNum = firstNum * 10 + value
                    output?.display(string: String(firstNum))
            case .mathOperation(let op):
            switch op {
                
            case .digit(let value):
                if firstNum > 0 {
                secondNum = secondNum * 10 + value
                result = secondNum
                output?.display(string: String (result))
                }
            case .plus:
                result = firstNum + secondNum
                output?.display(string: String(result))
            case .minus:
                result = firstNum - secondNum
                output?.display(string: String(result))
            case .mul:
                result = firstNum * secondNum
                output?.display(string: String(result))
            case .div:
                result = firstNum / secondNum
                output?.display(string: String(result))
            case .sign:
                result = result * (-1)
                output?.display(string: String(result))
            case .percent:
                result = result / 100
                output?.display(string: String(result))
            case .result:
                output?.display(string: String(result))

            case .clean:
                firstNum = 0
                secondNum = 0
                result = 0
                output?.display(string: "0")
            @unknown default:
                break
            }
            break
        case .result:
            output?.display(string: String(result))
        case .clean:
            firstNum = 0
            secondNum = 0
            result = 0
            output?.display(string: "0")
        case .initial:
            break
        case .point:
            <#code#>
        }
        prevState = state
        case .initial:
            <#code#>
        case .result:
            <#code#>
        case .clean:
            <#code#>
        case .point:
            <#code#>
        }
}

private extension CalculatorModelImpl {
    func newInternalState(_ inputState: Operation) -> InternalState {
        switch inputState {
        case .digit(let value):
            return .input(value)
        case .div, .minus, .mul, .percent, .plus, .point, .sign:
            return .mathOperation(inputState)
        case .result:
            return .result
        case .clean:
            return .clean
        }
    }
}
