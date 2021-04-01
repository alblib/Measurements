//
//  UnitElectricPotentialDifference.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

typealias Voltage = Measurement<UnitElectricPotentialDifference>

extension UnitElectricPotentialDifference: ZeroAlignedLinearDimension{
    class var nanovolts: UnitElectricPotentialDifference{
        UnitElectricPotentialDifference(symbol: "nV", converter: UnitConverterLinear(coefficient: 1e-9))
    }
}

func * (lhs: ElectricResistance, rhs: ElectricCurrent) -> Voltage{
    .init(value: lhs.value(in: .ohms) * rhs.value(in: .amperes), unit: .volts)
}
func * (rhs: ElectricCurrent, lhs: ElectricResistance) -> Voltage{
    .init(value: lhs.value(in: .ohms) * rhs.value(in: .amperes), unit: .volts)
}
