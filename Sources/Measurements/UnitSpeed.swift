//
//  UnitSpeed.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

extension UnitSpeed: ZeroAlignedLinearDimension{
    static let speedOfLight = UnitSpeed(symbol: "c", converter: UnitConverterLinear(coefficient: 299792458))
}
