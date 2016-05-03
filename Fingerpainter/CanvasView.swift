//
//  CanvasView.swift
//  Fingerpainter
//
//  Created by Mobile on 1/12/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class CanvasView : UIView {
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.magentaColor().CGColor)
        CGContextSetLineWidth(context, 10)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, 150, 400)
        CGContextStrokePath(context)
    }
    
}
