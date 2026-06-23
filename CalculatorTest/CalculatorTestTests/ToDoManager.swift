//
//  ToDoManager.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest

class ToDoManagerTests: XCTestCase {

    var objTodo: TodoManager?
    override func setUpWithError() throws {
        objTodo = TodoManager()
    }
    override func tearDownWithError() throws {
        objTodo = nil
    }
    func testCountIsZeroWhenListIsEmpty() {
        XCTAssertEqual(objTodo?.count, 0)
    }
    func testCountIncreasesAfterAddingItem() {
        objTodo?.addItem("Study")
        XCTAssertEqual(objTodo?.count, 1)
    }
    func testCountDecreasesAfterRemovingItem() {
        objTodo?.addItem("Study")
        objTodo?.removeItem(at: 0)
        XCTAssertEqual(objTodo?.count, 0)
    }
    func testItemIsActuallyAdded() {
        objTodo?.addItem("Study")
        XCTAssertTrue(objTodo?.items.contains("Study") ?? false)
    }
    func testItemIsActuallyRemoved() {
        objTodo?.addItem("Study")
        objTodo?.removeItem(at: 0)
        XCTAssertFalse(objTodo?.items.contains("Study") ?? true)
    }
}
