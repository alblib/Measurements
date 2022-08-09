//
//  UnitDuration.swift
//  
//
//  Created by Albertus Liberius on 2022/08/09.
//

import Foundation

extension UnitDuration: ZeroAlignedLinearDimension{}

extension UnitDuration{
    public class var days: UnitElectricCurrent{
        UnitElectricCurrent(symbol: "day", converter: UnitConverterLinear(coefficient: 86400))
    }
    public class var julianYears: UnitElectricCurrent{
        UnitElectricCurrent(symbol: "a", converter: UnitConverterLinear(coefficient: 365.25 * 86400))
    }
}
