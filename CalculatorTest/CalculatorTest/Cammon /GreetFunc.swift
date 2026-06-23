//
//  GreetFunc.swift
//  CalculatorTest
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

import Foundation
struct GreetFunc {
    func GreetFunc(name: String) -> String {
        if name.isEmpty {
            return "Hello, Guest!"
        }
        return "Hello, \(name)!"
    }
}
