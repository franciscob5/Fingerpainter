//
//  LineSizeViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 5/12/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class LineSizeViewController: UIViewController {

    
    @IBOutlet var slider: UISlider!
    @IBOutlet var lineW: UILabel!
    @IBOutlet var imgView: UIImageView!
    var parentTab : TabBarController!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "imgres.png")
        parentTab = self.tabBarController as! TabBarController
        slider.value = Float(parentTab.lineWidth / 100)
        lineW.text = "\(Int(slider.value * 100))"
        imgView.frame.size.height = CGFloat(slider.value / 100)
      
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func lineWidthChanged(sender: UISlider) {
        let num: Int! = Int(slider.value * 100)
        print(num)
        lineW.text = "\(num)"
        imgView.frame.size.height = CGFloat(num)
        //imgView.image?.size.height = CGFloat(num)
        parentTab.lineWidth = num
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController: ViewController = segue.destinationViewController as! ViewController
        viewController.lineData.lineColor = parentTab.lineColor
        viewController.lineData.lineWidth = parentTab.lineWidth
viewController.storedImage = parentTab.imageStorage
     viewController.reverseRevision = parentTab.undoStorage!
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
