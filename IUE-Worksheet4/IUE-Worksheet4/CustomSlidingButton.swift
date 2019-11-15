//
//  CustomSlidingButton.swift
//  IUE-Worksheet4
//
//  Created by José Pereira on 11/6/19.
//  Copyright © 2019 José Pereira. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSlidingButton: UIButton {
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        path.fill()
        
        let halfWidth = bounds.width / 2
        let halfHeight = bounds.height / 2
        
        let lineWidth: CGFloat = min(bounds.width, bounds.height) * 0.5
        let halfLineWidth = lineWidth / 2
        
        let linesPath = UIBezierPath()
        
        linesPath.lineWidth = 3
    
        UIColor.white.setStroke()
        linesPath.stroke()
    }
}
