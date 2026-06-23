//
//  CircleArea.swift
//  CalculatorTest
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

struct Circle {
    var radius: Double
    var area: Double {
        return Double.pi * radius * radius
    }
    var circumference: Double {
        return 2 * Double.pi * radius
    }
}
