//
//  UnitEnergy.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

extension UnitEnergy: ZeroAlignedLinearDimension{
    static let electronVolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-19))
    static let kiloElectronVolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-16))
    static let megaElectronVolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-13))
    static let gigaElectronVolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-10))
    static let teraElectronVolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-7))
}
