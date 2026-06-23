//
//  RetangleTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest

class  RectangleTests: XCTestCase {
    var objRectangle: Rectangle?
    
    override func setUpWithError() throws {
        objRectangle = Rectangle()
    }
    override func tearDownWithError() throws {
        objRectangle = nil
    }

    func testAreaOfRectangle() {
        let rect = Rectangle()
        XCTAssertEqual(rect.area(length: 10, width: 5), 50.0)
    }
}
