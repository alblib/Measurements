//
//  UnitElectricCharge.swift
//  
//
//  Created by Albertus Liberius on 2021/04/02.
//

import Foundation

public typealias ElectricCharge = Measurement<UnitElectricCharge>

extension UnitElectricCharge: ZeroAlignedLinearDimension{}

public extension UnitElectricCharge{
    class var electrons: UnitElectricCharge{
        UnitElectricCharge(symbol: "e", converter: UnitConverterLinear(coefficient: 1.602176634e-19))
    }
    class var statcoulombs: UnitElectricCharge{
        UnitElectricCharge(symbol: "esu", converter: UnitConverterLinear(coefficient: 1.0 / 2997924580))
    }
}
