//
//  UnitElectricResistance.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

public typealias ElectricResistance = Measurement<UnitElectricResistance>

extension UnitElectricResistance: ZeroAlignedLinearDimension{}

public extension UnitElectricResistance{
    class var statohms: UnitElectricResistance{
        .init(symbol: "statohm", converter: UnitConverterLinear(coefficient: pow(299792458,2) * 1e-5))
    }
}

public extension ElectricResistance{
    func joinedParallel(_ others: Measurement<UnitType> ...) -> Self{
        .init(value: 1 / (1 / self.value(in: .ohms) + others.map{1 / $0.value(in: .ohms)}.reduce(0, +)), unit: .ohms)
    }
}

public func / (lhs: Voltage, rhs: ElectricCurrent) -> ElectricResistance{
    .init(value: lhs.value(in: .volts) * rhs.value(in: .amperes), unit: .ohms)
}

@objc open class UnitElectricConductance: Dimension, ZeroAlignedLinearDimension{
    class open override func baseUnit() -> Self {
        UnitElectricConductance.siemens as! Self
    }
    open class var siemens: UnitElectricConductance{ // mhos
        .init(symbol: "S", converter: UnitConverterLinear(coefficient: 1))
    }
}

public typealias ElectricConductance = Measurement<UnitElectricConductance>
public extension ElectricResistance{
    var inverse: ElectricConductance{
        .init(value: (1 / self.value(in: .ohms)), unit: .siemens)
    }
}
public extension ElectricConductance{
    var inverse: ElectricResistance{
        .init(value: 1 / self.value(in: .siemens), unit: .ohms)
    }
}
