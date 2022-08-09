//
//  UnitSpeed.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

extension UnitSpeed: ZeroAlignedLinearDimension{
    public class var speedOfLight: UnitSpeed{
        UnitSpeed(symbol: "c", converter: UnitConverterLinear(coefficient: 299792458))
    }
    // https://developer.apple.com/documentation/foundation/nsdimension
    public class var furlongsPerFortnight: UnitSpeed{
        UnitSpeed(symbol: "fur/ftn", converter: UnitConverterLinear(coefficient: 201.168 / 1209600.0))
    }
}
