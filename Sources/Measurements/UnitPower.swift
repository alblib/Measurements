//
//  File.swift
//  
//
//  Created by Albertus Liberius on 2021/04/01.
//

import Foundation

func * (lhs: Voltage, rhs: ElectricCurrent) -> Measurement<UnitPower>{
    .init(value: lhs.value(in: .volts) * rhs.value(in: .amperes), unit: .watts)
}

func * (rhs: ElectricCurrent, lhs: Voltage) -> Measurement<UnitPower>{
    .init(value: lhs.value(in: .volts) * rhs.value(in: .amperes), unit: .watts)
}
