//
//  CustomButton.swift
//  IUE-Worksheet4
//
//  Created by José Pereira on 11/6/19.
//  Copyright © 2019 José Pereira. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let halfWidth = bounds.width / 2
        let halfHeight = bounds.height / 2
        
        let lineWidth: CGFloat = min(bounds.width, bounds.height) * 0.5
        let halfLineWidth = lineWidth / 2
        
        let linesPath = UIBezierPath()
        
        linesPath.lineWidth = 3
        
        linesPath.move(to: CGPoint(
            x: halfWidth - halfLineWidth,
            y: halfHeight))
        
        linesPath.addLine(to: CGPoint(
            x: halfWidth + halfLineWidth,
            y: halfHeight))
        
        if (isAddButton) {
            linesPath.move(to: CGPoint(
                x: halfWidth,
                y: halfHeight - halfLineWidth))
            linesPath.addLine(to: CGPoint(
                x: halfWidth,
                y: halfHeight + halfLineWidth))
        }
        
        UIColor.white.setStroke()
        linesPath.stroke()
    }
}
