//
//  CalculatorTestTests.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest

@MainActor
final class CalculatorTestTests: XCTestCase {
    
    var objCalculator:CalculatorProtocol?
   // var objRectangle: Rectangle?
    //var ObjCircle: CircleArea?
    //var objgreet: greetUser?

    override func setUpWithError() throws {
        objCalculator = Calculator()
    }
    override func tearDownWithError() throws {
        objCalculator = nil
    }
    func testSum() throws {
        let result = objCalculator?.sum(n1: 1, n2: 2)
        XCTAssertEqual(result,3)
    }
    func testSub() throws {
        let result = objCalculator?.sub(n1: 2, n2: 1)
        XCTAssertEqual(result,1)
    }
    func testMul() throws{
    let result = objCalculator?.mul(n1: 20, n2: 10)
        XCTAssertEqual(result,200)
    }
    func testDiv() throws{
        let result = objCalculator?.div(n1: 6, n2: 2)
        XCTAssertEqual(result,3.00)
    }
    func testAreaRectangle() {
        let rect = Rectangle()
        let result = rect.area(length: 10, width: 5)
        XCTAssertEqual(result, 50.0)

    }
//
//    func testAreaRectangleViewDidLoad() {
//
//        let vc = AreaRectangle()
//
//        vc.loadViewIfNeeded()
//
//        XCTAssertNotNil(vc.view)
//
//    }
//    func testAreaForRadius5() {
//        let circle = CircleArea(radius: 5)
//        XCTAssertEqual(circle.area, Double.pi * 25, accuracy: 0.001)
//    }
//    func testCircumferenceForRadius5() {
//        let circle = CircleArea(radius: 5)
//        XCTAssertEqual(circle.circumference, 2 * Double.pi * 5, accuracy: 0.001)
//    }
//    func testAreaIsZeroWhenRadiusIsZero() {
//        let circle = CircleArea(radius: 0)
//        XCTAssertEqual(circle.area, 0, accuracy: 0.001)
//    }
//    func testAreaIsNeverNegative() {
//        let circle = CircleArea(radius: 5)
//        XCTAssertGreaterThanOrEqual(circle.area, 0)
//    }
    
//    func testValidName() {
//        XCTAssertEqual(greetUser(name: "Rajitha"), "Hello, Rajitha!")
//    }
//    func testEmptyName() {
//        XCTAssertEqual(greetUser(name: ""), "Hello, Guest!")
//    }
//    func testNameWithSpaces() {
//        XCTAssertEqual(greetUser(name: "Naga Rajitha"), "Hello, Naga Rajitha!")
//    }
//    func testNameWithNumbers() {
//        XCTAssertEqual(greetUser(name: "Rajitha123"), "Hello, Rajitha123!")
//    }
//    
//    func testCountisZeroWhenListIsEmpty() {
//        let manager = TodoManager()
//        XCTAssertEqual(manager.count,0)
//    }
//    func testCountIncreasesAfterAddingAnItem() {
//        var manager = TodoManager()
//        XCTAssertEqual(manager.count, 1)
//    }
//    func testCountDecreasesAfterRemovingAnItem() {
//        var manager = TodoManager()
//        XCTAssertEqual(manager.count, 1)
//    }
    


    


}
