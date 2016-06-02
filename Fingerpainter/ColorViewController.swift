//
//  ColorViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 1/15/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UIPickerViewDelegate {
    
   
    var isCustomColorOn: Bool = false
    
    
    @IBOutlet var colorDemo: UIImageView!
    
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var BlueSlider: UISlider!
    
    @IBOutlet var alphaSlider: UISlider!
    @IBOutlet var colorPickerView: UIPickerView!
    
    @IBAction func alphaSlider(sender: UISlider) {
        
        newColor()
        if isCustomColorOn == true{
            parentTab.lineColor = customColor
        }
        
    }
    
    let cPVDS = ColorPickerViewDataSource()
    
    var parentTab : TabBarController!
   
    @IBAction func redSliderMoved(sender: UISlider) {
        newColor()
        if isCustomColorOn == true{
            parentTab.lineColor = customColor
        }
    }
    @IBAction func greenSliderMoved(sender: UISlider) {
        newColor()
        if isCustomColorOn == true{
            parentTab.lineColor = customColor
        }
    }
    @IBAction func blueSliderMoved(sender: UISlider) {
        newColor()
        if isCustomColorOn == true{
            parentTab.lineColor = customColor
        }
    }
    
    var customColor: UIColor = UIColor.blackColor()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        colorPickerView.delegate = self
        colorPickerView.dataSource = cPVDS
        parentTab = self.tabBarController as! TabBarController
    
        
           var components: [CGFloat] = rgb(parentTab.lineColor)
            
            
            let redVal = components[0]
            let greenVal = components[1]
            let blueVal = components[2]
            let alphaVal = components[3]
            redSlider.value = Float(redVal)
            greenSlider.value = Float(greenVal)
            BlueSlider.value = Float(blueVal)
            alphaSlider.value = Float(alphaVal)
            

        
       
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        return cPVDS.colorOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       if row == 0{
            parentTab.lineColor = UIColor.blackColor()
            isCustomColorOn = false
        }
        if row == 1{
            parentTab.lineColor = UIColor.darkGrayColor()
            isCustomColorOn = false
        }
        if row == 2{
            parentTab.lineColor = UIColor.lightGrayColor()
            isCustomColorOn = false
        }
        if row == 3{
            parentTab.lineColor = UIColor.whiteColor()
            isCustomColorOn = false
        }
        if row == 4{
           parentTab.lineColor = UIColor.grayColor()
            isCustomColorOn = false
        }
        if row == 5{
           parentTab.lineColor = UIColor.redColor()
            isCustomColorOn = false
        }
        if row == 6{
            parentTab.lineColor = UIColor.greenColor()
            isCustomColorOn = false
        }
        if row == 7{
            parentTab.lineColor = UIColor.blueColor()
            isCustomColorOn = false
        }
        if row == 8{
            parentTab.lineColor = UIColor.cyanColor()
            isCustomColorOn = false
        }
        if row == 9{
            parentTab.lineColor = UIColor.magentaColor()
            isCustomColorOn = false
        }
        if row == 10{
            parentTab.lineColor = UIColor.yellowColor()
            isCustomColorOn = false
        }
        if row == 11{
            parentTab.lineColor = UIColor.orangeColor()
            isCustomColorOn = false
        }
        if row == 12{
            parentTab.lineColor = UIColor.purpleColor()
            isCustomColorOn = false
        }
        if row == 13{
            parentTab.lineColor = UIColor.brownColor()
            isCustomColorOn = false
        }
        if row == 14{
            isCustomColorOn = true
            parentTab.lineColor = customColor
        }

    }
    
    func newColor(){
        customColor = UIColor(red: CGFloat(redSlider.value)  , green: CGFloat(greenSlider.value) , blue: CGFloat(BlueSlider.value) , alpha: CGFloat(alphaSlider.value) )
        colorDemo.image = getImageWithColor(customColor, size: CGSize(width: 37 , height: 148))
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if isCustomColorOn == true{
            parentTab.lineColor = customColor
        }
        let viewController: ViewController = segue.destinationViewController as! ViewController
        viewController.lineData.lineColor = parentTab.lineColor
        viewController.lineData.lineWidth = parentTab.lineWidth
        viewController.storedImage = parentTab.imageStorage
         viewController.reverseRevision = parentTab.undoStorage!
        
    }
    func rgb(inputColor: UIColor) -> [CGFloat]{
        var rgbArray : [CGFloat] = [ 0, 0, 0, 0]
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        inputColor.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        rgbArray[0] = fRed
        rgbArray[1] = fGreen
        rgbArray[2] = fBlue
        rgbArray[3] = fAlpha
        return rgbArray
            
          
        
    }
    
}