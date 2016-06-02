//
//  TabBarController.swift
//  Fingerpainter
//
//  Created by Mobile on 5/18/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var lineColor: UIColor = UIColor.blackColor()
    var lineWidth: Int = 1
    var imageStorage : UIImage!
    var undoStorage : [UIImage]?
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
