//
//  UnitElectricCurrent.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

typealias ElectricCurrent = Measurement<UnitElectricCurrent>

extension UnitElectricCurrent: ZeroAlignedLinearDimension{
    class var nanoamperes: UnitElectricCurrent{
        UnitElectricCurrent(symbol: "nA", converter: UnitConverterLinear(coefficient: 1e-9))
    }
    class var picoamperes: UnitElectricCurrent{
        UnitElectricCurrent(symbol: "pA", converter: UnitConverterLinear(coefficient: 1e-9))
    }
}

func / (lhs: Voltage, rhs: ElectricResistance) -> ElectricCurrent{
    .init(value: lhs.value(in: .volts) / rhs.value(in: .ohms), unit: .amperes)
}