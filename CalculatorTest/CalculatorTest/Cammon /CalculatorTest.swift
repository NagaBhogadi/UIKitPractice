//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by Naga Rajitha Bhogadi on 6/8/26.
//

protocol CalculatorProtocol{
    func sum(n1: Int?,n2:Int?) -> Int
    func sub(n1: Int?,n2: Int?) -> Int
    func mul(n1: Int?,n2: Int?) -> Int
    func div(n1: Int?,n2: Int?) -> Double
    
}

struct Calculator: CalculatorProtocol{
    func sum(n1: Int?,n2:Int?) -> Int{
        guard let n1 = n1, let n2 = n2 else { return 0}
        return n1 + n2
    }
    func sub(n1: Int?,n2: Int?) -> Int {
        guard let n1 = n1, let n2 = n2 else { return 0}
        return n1 - n2
    }
    func mul(n1: Int?,n2: Int?) -> Int{
        guard let n1 = n1, let n2 = n2 else { return 0}
        return Int(n1 * n2 )
    }
    func div(n1: Int?,n2: Int?) -> Double {
        guard let n1 = n1, let n2 = n2 else { return 0}
        return Double(n1 / n2)
    }
}

