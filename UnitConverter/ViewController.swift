//
//  ViewController.swift
//  UnitConverter
//
//  Created by Marco Nie on 12/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"
    @IBOutlet weak var celsiusPicker: UIPickerView!
    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!

    private var converter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaultPickRow = initialPickerRow()
        celsiusPicker.selectRow(defaultPickRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickRow, inComponent: 0)
    }

    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
        if let row = savedRow {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSlectedRow(row: row)
    }
    
    func displayConvertedTemperatureForRow(row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreeCelsius: degreesCelsius))°F"
    }
    
    func saveSlectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
}

