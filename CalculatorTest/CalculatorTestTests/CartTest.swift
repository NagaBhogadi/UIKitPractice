//
//  CartTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import XCTest
@testable import CalculatorTest
class ShoppingCartTests: XCTestCase {
    
    var objCart: ShoppingCart?
    
    override func setUpWithError() throws {
        objCart = ShoppingCart()
    }
    override func tearDownWithError() throws {
        objCart = nil
    }

    func testSubtotalIsZeroForEmptyCart() {
        let cart = ShoppingCart()
        XCTAssertEqual(cart.subtotal, 0.0)
    }

    func testSubtotalIsCorrectForOneItem() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 2.0, quantity: 3))
        XCTAssertEqual(cart.subtotal, 6.0)
    }

    func testSubtotalIsCorrectForMultipleItems() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 2.0, quantity: 3))
        cart.addItem(CartItem(name: "Milk", price: 4.0, quantity: 2))
        XCTAssertEqual(cart.subtotal, 14.0)
    }

    func testTaxIsEightPercentOfSubtotal() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 100.0, quantity: 1))
        XCTAssertEqual(cart.tax, 8.0)
    }

    func testTotalEqualsSubtotalPlusTax() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 100.0, quantity: 1))
        XCTAssertEqual(cart.total, 108.0)
    }

    func testCartIsEmptyAfterClearCart() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 2.0, quantity: 3))
        cart.clearCart()
        XCTAssertTrue(cart.items.isEmpty)
    }

    func testItemCountIsCorrectAfterAddingItems() {
        var cart = ShoppingCart()
        cart.addItem(CartItem(name: "Apple", price: 2.0, quantity: 3))
        cart.addItem(CartItem(name: "Milk", price: 4.0, quantity: 2))
        XCTAssertEqual(cart.items.count, 2)
    }
}
