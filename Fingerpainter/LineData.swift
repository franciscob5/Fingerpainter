//
//  LineData.swift
//  Fingerpainter
//
//  Created by Mobile on 5/13/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import Foundation
import UIKit

class LineData: NSObject {
    var lineColor : UIColor
    var lineWidth : Int
     override init() {
        lineColor = UIColor.blackColor()
        lineWidth = 2
    }
}
