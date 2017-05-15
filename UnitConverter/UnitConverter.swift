//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Marco Nie on 12/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import Foundation


class UnitConverter {
    func degreesFahrenheit(degreeCelsius: Int) -> Int {
        return Int(1.8 * Float(degreeCelsius) + 32.0)
    }

}
