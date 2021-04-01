//
//  UnitConverter.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

/** A unit with logarithmic scale e.g. decibels */
@objc class UnitConverterLogarithm: UnitConverter{
    let base: Double
    let coefficient: Double
    init(base: Double, coefficient: Double){
        self.base = base
        self.coefficient = coefficient
    }
    override func baseUnitValue(fromValue value: Double) -> Double {
        pow(base, value / coefficient)
    }
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        log(abs(baseUnitValue)) / log(base) * coefficient
    }
}

/** A unit with power scale. */
@objc class UnitConverterPower: UnitConverter{
    let exponent: Double
    let coefficient: Double
    
    init(exponent: Double, coefficient: Double = 1){
        self.exponent = exponent
        self.coefficient = coefficient
    }
    
    override func baseUnitValue(fromValue value: Double) -> Double {
        pow(value / coefficient, 1/exponent)
    }
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        coefficient * pow(baseUnitValue, exponent)
    }
}
