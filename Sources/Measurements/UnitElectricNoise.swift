//
//  UnitElectricNoise.swift
//  
//
//  Created by Albertus Liberius on 2021/06/20.
//

import SwiftUI

public class UnitElectricPotentialNoiseDensity: Dimension, ZeroAlignedLinearDimension{
    public class var nanovoltsPerSquareRootHertz: UnitElectricPotentialNoiseDensity{
        UnitElectricPotentialNoiseDensity(symbol: "nV/√Hz", converter: UnitConverterLinear(coefficient: 1))
    }
    class public override func baseUnit() -> Self {
        Self.nanovoltsPerSquareRootHertz as! Self
    }
}
public class UnitElectricCurrentNoiseDensity: Dimension, ZeroAlignedLinearDimension{
    public class var picoamperesPerSquareRootHertz: UnitElectricCurrentNoiseDensity{
        UnitElectricCurrentNoiseDensity(symbol: "pA/√Hz", converter: UnitConverterLinear(coefficient: 1))
    }
    class public override func baseUnit() -> Self {
        Self.picoamperesPerSquareRootHertz as! Self
    }
    public class var femtoamperesPerSquareRootHertz: UnitElectricCurrentNoiseDensity{
        UnitElectricCurrentNoiseDensity(symbol: "pA/√Hz", converter: UnitConverterLinear(coefficient: 1e-3))
    }
}
public class UnitPowerNoiseDensity: Dimension, ZeroAlignedLinearDimension{
    class public var microwattsPerHertz: UnitPowerNoiseDensity{
        UnitPowerNoiseDensity(symbol: "µW/Hz", converter: UnitConverterLinear(coefficient: 1))
    }
    class public override func baseUnit() -> Self {
        Self.microwattsPerHertz as! Self
    }
    public class var nanowattsPerHertz: UnitPowerNoiseDensity{
        UnitPowerNoiseDensity(symbol: "nW/Hz", converter: UnitConverterLinear(coefficient: 1e3))
    }
    public class var milliwattsPerHertz: UnitPowerNoiseDensity{
        UnitPowerNoiseDensity(symbol: "mW/Hz", converter: UnitConverterLinear(coefficient: 1e3))
    }
}

public typealias ElectricPotentialNoiseDensity = Measurement<UnitElectricPotentialNoiseDensity>
public typealias ElectricCurrentNoiseDensity = Measurement<UnitElectricCurrentNoiseDensity>
public typealias PowerNoiseDensity = Measurement<UnitPowerNoiseDensity>

public extension PowerNoiseDensity{
    init(electricPotentialNoiseDensity: ElectricPotentialNoiseDensity, impedance: ElectricResistance){
        let vNoiseDensityValue = electricPotentialNoiseDensity.value(in: .nanovoltsPerSquareRootHertz)
        self.init(value: vNoiseDensityValue * vNoiseDensityValue / impedance.value(in: .ohms) * 1e12,
                  unit: .microwattsPerHertz)
    }
    init(electricCurrentNoiseDensity: ElectricCurrentNoiseDensity, impedance: ElectricResistance){
        let iNoiseDensityValue = electricCurrentNoiseDensity.value(in: .picoamperesPerSquareRootHertz)
        self.init(value: iNoiseDensityValue * iNoiseDensityValue * impedance.value(in: .ohms) * 1e18,
                  unit: .microwattsPerHertz)
    }
}

public extension ElectricPotentialNoiseDensity{
    init(powerNoiseDensity: PowerNoiseDensity, impedance: ElectricResistance){
        self.init(value: sqrt(powerNoiseDensity.value(in: .microwattsPerHertz) * impedance.value(in: .ohms)) * 1e-6,
                  unit: .nanovoltsPerSquareRootHertz)
    }
}
public extension ElectricCurrentNoiseDensity{
    init(powerNoiseDensity: PowerNoiseDensity, impedance: ElectricResistance){
        self.init(value: sqrt(powerNoiseDensity.value(in: .microwattsPerHertz) / impedance.value(in: .ohms)) * 1e-9,
                  unit: .picoamperesPerSquareRootHertz)
    }
}
