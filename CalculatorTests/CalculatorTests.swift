//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Krasa on 26/10/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import XCTest
@testable import Calculator

class MockOutput: CalculatorModelOutput {
    var testOutput = ""
    func display(string: String) {
        testOutput = string
    }
}

class CalculatorTests: XCTestCase {
    private var calcModel: CalculatorModel!

    override func setUp() {
        calcModel = CalculatorModelImpl()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        calcModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutput() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(2))
        //then
        XCTAssert(output.testOutput == "12", "Обоссамс")
    }
    
    func testPlus() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(2))
        calcModel.input(op: .plus)
        calcModel.input(op: .digit(2))
        calcModel.input(op: .digit(3))
        //then
        XCTAssert(output.testOutput == "35", "Обоссамс")
    }
    func testMinus() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(5))
        calcModel.input(op: .minus)
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(0))
        //then
        XCTAssert(output.testOutput == "5", "Обоссамс")
    }
    func testMul() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(0))
        calcModel.input(op: .mul)
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(0))
        //then
        XCTAssert(output.testOutput == "100", "Обоссамс")
    }
    func testDiv() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(4))
        calcModel.input(op: .digit(4))
        calcModel.input(op: .div)
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(2))
        //then
        XCTAssert(output.testOutput == "12", "Обоссамс")
    }
    func testClean() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(4))
        calcModel.input(op: .digit(4))
        calcModel.input(op: .clean)
        
        //then
        XCTAssert(output.testOutput == "0", "Обоссамс")
    }
    func testPoint() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(4))
        calcModel.input(op: .point)
        calcModel.input(op: .digit(4))
        
        //then
        XCTAssert(output.testOutput == "14.4", "Обоссамс")
    }
    func testProcent() {
        // given
        let output = MockOutput()
        calcModel.output = output
        // when
        calcModel.input(op: .digit(1))
        calcModel.input(op: .digit(0))
        calcModel.input(op: .digit(0))
        calcModel.input(op: .percent)
        //then
        XCTAssert(output.testOutput == "1", "Обоссамс")
    }
    
}
