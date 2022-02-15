//
//  UnitRelativePower.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

@objc open class UnitRelativePower: Dimension{
    class open override func baseUnit() -> Self {
        UnitRelativePower.amplitudeRatio as! Self
    }
    open class var amplitudeRatio: UnitRelativePower{
        UnitRelativePower(symbol: "by amplitude", converter: UnitConverterLinear(coefficient: 1))
    }
    open class var powerRatio: UnitRelativePower{
        UnitRelativePower(symbol: "by power", converter: UnitConverterPower(exponent: 2))
    }
    open class var percents: UnitRelativePower{
        UnitRelativePower(symbol: "%", converter: UnitConverterLinear(coefficient: 0.01))
    }
    open class var decibels: UnitRelativePower{
        UnitRelativePower(symbol: "dB", converter: UnitConverterLogarithm(base: 10, coefficient: 20))
    }
}

public typealias RelativePower = Measurement<UnitRelativePower>

public protocol AmplitudeRelativeDimension: ZeroAlignedLinearDimension{}
public protocol PowerRelativeDimension: ZeroAlignedLinearDimension{}
extension UnitElectricPotentialDifference: AmplitudeRelativeDimension{}
extension UnitElectricCurrent: AmplitudeRelativeDimension{}
extension UnitElectricResistance: AmplitudeRelativeDimension{}
extension UnitPower: PowerRelativeDimension{}
extension UnitEnergy: PowerRelativeDimension{}

public extension RelativePower{
    init<RawUnitType>(_ lhs: Measurement<RawUnitType>, over rhs: Measurement<RawUnitType>) where RawUnitType: AmplitudeRelativeDimension{
        self.init(value: lhs.value / rhs.value(in: lhs.unit), unit: .amplitudeRatio)
    }
    init<RawUnitType>(_ lhs: Measurement<RawUnitType>, over rhs: Measurement<RawUnitType>) where RawUnitType: PowerRelativeDimension{
        self.init(value: lhs.value / rhs.value(in: lhs.unit), unit: .powerRatio)
    }
    init<RawUnitType>(rangeFrom lhs: Measurement<RawUnitType>, to rhs: Measurement<RawUnitType>) where RawUnitType: AmplitudeRelativeDimension{
        if lhs > rhs{
            self.init(value: lhs.value / rhs.value(in: lhs.unit), unit: .amplitudeRatio)
        }else{
            self.init(value: rhs.value / lhs.value(in: rhs.unit), unit: .amplitudeRatio)
        }
    }
    init<RawUnitType>(rangeFrom lhs: Measurement<RawUnitType>, to rhs: Measurement<RawUnitType>) where RawUnitType: PowerRelativeDimension{
        if lhs > rhs{
            self.init(value: lhs.value / rhs.value(in: lhs.unit), unit: .powerRatio)
        }else{
            self.init(value: rhs.value / lhs.value(in: rhs.unit), unit: .powerRatio)
        }
    }
}
