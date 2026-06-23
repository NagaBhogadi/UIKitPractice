//
//  GreetFuncTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest

final class GreetFuncTests: XCTestCase {

    var objGreet: GreetFunc?

    override func setUpWithError() throws {
        objGreet = GreetFunc()
    }

    override func tearDownWithError() throws {
        objGreet = nil
    }

    func testValidName() {
        let result = objGreet?.GreetFunc(name: "Rajitha")
        XCTAssertEqual(result, "Hello, Rajitha!")
    }

    func testEmptyName() {
        let result = objGreet?.GreetFunc(name: "")
        XCTAssertEqual(result, "Hello, Guest!")
    }

    func testNameWithSpaces() {
        let result = objGreet?.GreetFunc(name: "Naga Rajitha")
        XCTAssertEqual(result, "Hello, Naga Rajitha!")
    }

    func testNameWithNumbers() {
        let result = objGreet?.GreetFunc(name: "Rajitha123")
        XCTAssertEqual(result, "Hello, Rajitha123!")
    }
}
