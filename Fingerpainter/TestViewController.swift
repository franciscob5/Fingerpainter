//
//  TestViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 5/12/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(sender: UIButton) {
        canvas.image = nil
    }
    @IBOutlet var canvas: UIImageView!
    var start: CGPoint?
    var color : UIColor = UIColor.blackColor()

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        start = touch.locationInView(canvas)
        //print message with breakpoint here
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        let end = touch.locationInView(canvas)
        if let fromPoint = self.start{
            drawFromPoint(fromPoint, toPoint: end)
        }
        start = end
        
        //print message with breakpoint here
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func drawFromPoint(start: CGPoint, toPoint end : CGPoint){
        UIGraphicsBeginImageContext(canvas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        canvas.image?.drawInRect(CGRect(x: 0, y: 0, width: canvas.frame.size.width, height: canvas.frame.size.height))
        CGContextSetLineWidth(context, 5)
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        let newimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        canvas.image = newimage
    }


}
