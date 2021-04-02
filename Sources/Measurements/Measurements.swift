import Foundation
import SwiftUI
import Combine

internal struct Measurements {
    var text = "Hello, World!"
}

/** Dimension where all units have the same fixed zero point and only magnifying factor matters. Zero point can be defined in this dimension. */
public protocol ZeroAlignedLinearDimension: Dimension{}

public extension Measurement where UnitType: ZeroAlignedLinearDimension{
    static var zero: Self{
        .init(value: 0, unit: .baseUnit())
    }
}

public extension Measurement where UnitType: Dimension{
    func value(in unit: UnitType) -> Double{
        converted(to: unit).value
    }
}

/** Binding value with given unit from Measurement. */
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func BindingValue<UnitType: Dimension>(_ measurement: Binding< Measurement<UnitType> >, in unit: UnitType) -> Binding<Double>{
    Binding<Double> { () -> Double in
        measurement.wrappedValue.value(in: unit)
    } set: { (newValue) in
        measurement.wrappedValue = Measurement(value: newValue, unit: unit)
    }
}
