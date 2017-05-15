//
//  TemperatureRange.swift
//  UnitConverter
//
//  Created by Marco Nie on 12/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {

    var values = [Int]()
    
    override init() {
        for index in -100...100 {
            values.append(index)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
