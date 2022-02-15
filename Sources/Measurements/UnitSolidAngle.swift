//
//  UnitSolidAngle.swift
//  
//
//  Created by Albertus Liberius on 2022/02/15.
//

import Foundation

@objc open class UnitSolidAngle: Dimension, ZeroAlignedLinearDimension{
    class open override func baseUnit() -> Self {
        UnitSolidAngle.spats as! Self
    }
    open class var spats: UnitSolidAngle{ // @NSCopying
        UnitSolidAngle(symbol: "sp", converter: UnitConverterLinear(coefficient: 1))
    }/*
    open class var spheres: UnitSolidAngle { // spat
        spats
    }*/ // remove duplicate
    open class var steradians: UnitSolidAngle{
        UnitSolidAngle(symbol: "sr", converter: UnitConverterLinear(coefficient: 1 / (4 * Double.pi)))
    }
    open class var squareDegrees: UnitSolidAngle{
        UnitSolidAngle(symbol: "deg²", converter: UnitConverterLinear(coefficient: Double.pi / 129600))
    }
    open class var squareArcMinutes: UnitSolidAngle{
        UnitSolidAngle(symbol: "arcmin²", converter: UnitConverterLinear(coefficient: Double.pi / 4.6656e8))
    }
    open class var squareArcSeconds: UnitSolidAngle{
        UnitSolidAngle(symbol: "arcsec²", converter: UnitConverterLinear(coefficient: Double.pi / 1.679616e12))
    }
}
