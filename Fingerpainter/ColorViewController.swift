//
//  ColorViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 1/15/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UIPickerViewDelegate {
    
   
    
    @IBOutlet var colorDemo: UIImageView!
    
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var BlueSlider: UISlider!
    
    @IBOutlet var colorPickerView: UIPickerView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        colorPickerView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cPVDS = ColorPickerViewDataSource()
        return cPVDS.colorOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
            
        }
        if row == 1{
            
        }
        if row == 2{
            
        }
        if row == 3{
            
        }
        if row == 4{
            
        }
        if row == 5{
            
        }
        if row == 6{
            
        }
        if row == 7{
            
        }
        if row == 8{
            
        }
        if row == 9{
            
        }
        if row == 10{
            
        }
        if row == 11{
            
        }
        if row == 12{
            
        }
        if row == 13{
            
        }
    }

}