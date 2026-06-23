//
//  LogInTest.swift
//  CalculatorTestTests
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//


import XCTest
@testable import CalculatorTest

class LoginValidatorTests: XCTestCase {
    
    var objLogin: LoginValidator?
    override func setUpWithError() throws {
        objLogin = LoginValidator()
    }
    
    override func tearDownWithError() throws {
        objLogin = nil
    }

    func testValidEmailPasses() {
        let result = LoginValidator()
        XCTAssertTrue(result.isValidEmail("test@gmail.com"))
    }

    func testEmailWithoutAtFails() {
        let result = LoginValidator()
        XCTAssertFalse(result.isValidEmail("testgmail.com"))
    }

    func testEmailWithoutDotFails() {
        let result = LoginValidator()
        XCTAssertFalse(result.isValidEmail("test@gmailcom"))
    }

    func testEmptyEmailFails() {
        let result = LoginValidator()
        XCTAssertFalse(result.isValidEmail(""))
    }

    func testPasswordWith8CharactersPasses() {
        let result = LoginValidator()
        XCTAssertTrue(result.isValidPassword("12345678"))
    }

    func testPasswordWith7CharactersFails() {
        let result = LoginValidator()
        XCTAssertFalse(result.isValidPassword("1234567"))
    }

    func testEmptyPasswordFails() {
        let result = LoginValidator()
        XCTAssertFalse(result.isValidPassword(""))
    }

    func testCanLoginReturnsTrueWhenBothAreValid() {
        let result = LoginValidator()
        XCTAssertTrue(result.canLogin(email: "test@gmail.com", password: "12345678"))
    }

    func testCanLoginReturnsFalseWhenEmailIsInvalid() {
        let result = LoginValidator()
        XCTAssertFalse(result.canLogin(email: "testgmail.com", password: "12345678"))
    }

    func testCanLoginReturnsFalseWhenPasswordIsInvalid() {
        let result = LoginValidator()
        XCTAssertFalse(result.canLogin(email: "test@gmail.com", password: "1234567"))
    }
}
