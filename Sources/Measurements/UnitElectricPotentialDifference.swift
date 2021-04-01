//
//  File.swift
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
