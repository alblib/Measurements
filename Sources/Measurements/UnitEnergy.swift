//
//  UnitEnergy.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

extension UnitEnergy: ZeroAlignedLinearDimension{}

public extension UnitEnergy{
    class var electronVolts: UnitEnergy{
        UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-19))
    }
    class var kiloElectronVolts: UnitEnergy{
        UnitEnergy(symbol: "keV", converter: UnitConverterLinear(coefficient: 1.602176634e-16))
    }
    class var megaElectronVolts: UnitEnergy{
        UnitEnergy(symbol: "MeV", converter: UnitConverterLinear(coefficient: 1.602176634e-13))
    }
    class var gigaElectronVolts: UnitEnergy{
        UnitEnergy(symbol: "GeV", converter: UnitConverterLinear(coefficient: 1.602176634e-10))
    }
    class var teraElectronVolts: UnitEnergy {
        UnitEnergy(symbol: "TeV", converter: UnitConverterLinear(coefficient: 1.602176634e-7))
    }
}
