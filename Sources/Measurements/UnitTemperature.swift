//
//  UnitTemperature.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

public typealias Temperature = Measurement<UnitTemperature>

public extension Temperature{
    /** Gives the temperature multiplied by the Boltzmann constant. */
    var convertedToEnergy: Measurement<UnitEnergy>{
        .init(value: self.converted(to: .kelvin).value * 1.380649e-23, unit: .joules) // now new definition defines exact.
    }
    /** Room temperature 25 degrees Celsius. */
    static var room: Measurement<UnitType>{
        .init(value: 25, unit: .celsius)
    }
    /** Temperature of absolute zero. */
    static var absoluteZero: Measurement<UnitType>{
        .init(value: 0, unit: .kelvin)
    }
}
