//
//  ColorPickerDataSource.swift
//  Fingerpainter
//
//  Created by Mobile on 1/15/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class ColorPickerViewDataSource: NSObject, UIPickerViewDataSource {
    
    let colorOptions = [ "Black", "Dark Grey", "Light Grey", "White", "Grey", "Red", "Green", "Blue", "Cyan", "Magenta", "Yellow", "Orange", "Purple", "Brown", "Custom"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorOptions.count
    }
    
}