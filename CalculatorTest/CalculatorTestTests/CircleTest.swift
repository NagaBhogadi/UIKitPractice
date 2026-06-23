//
//  CircleTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest

class CircleTests: XCTestCase {
    
    var objCircle: Circle!
    
    override func setUpWithError() throws {
        objCircle = Circle(radius: 5)
    }
    override func tearDownWithError() throws {
        objCircle = nil
    }
    
    func testCircleAreaForRadius5() {
        let result = objCircle.area
        XCTAssertEqual(result, Double.pi * 25, accuracy : 0.001)
        
    }
    func testCircumferenceForRadius5() {
        let circle = Circle(radius: 5)
        XCTAssertEqual(circle.circumference, 2 * Double.pi * 5, accuracy: 0.001)
    }
    func testAreaIsZeroWhenRadiusIsZero() {
        let circle = Circle(radius: 0)
        XCTAssertEqual(circle.area, 0, accuracy: 0.001)
    }
}
