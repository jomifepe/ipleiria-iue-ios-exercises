//
//  CounterView.swift
//  IUE-Worksheet4
//
//  Created by José Pereira on 11/6/19.
//  Copyright © 2019 José Pereira. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {
    @IBInspectable var maxNumber: Int = 12
    @IBInspectable var currentNumber: Int = 3 {
        didSet {
            if currentNumber <= maxNumber {
                if currentNumber >= 0 {
                    setNeedsDisplay()
                    return
                }
                currentNumber = 0
                return
            }
            currentNumber = maxNumber
        }
    }
    
    @IBInspectable var circleColor: UIColor = UIColor(red: (33/255.0), green: (33/255.0), blue: (33/255.0), alpha: 1.0)
    @IBInspectable var barColor: UIColor = UIColor(red: (255/255.0), green: (23/255.0), blue: (68/255.0), alpha: 1.0)

    override func draw(_ rect: CGRect) {
        let circle = UIBezierPath(ovalIn: bounds)
        circleColor.setFill()
        circle.fill()
        
        // center: calculates the center point (half the width and half the height of the bounds);
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        // startAngle: by default, the design of the arc starts on the right. So, we need to rotate it -90º to make the line start on the top. As iOS works with radians, we calculate it as -pi/2;
        let startAngle: CGFloat = -.pi / 2
        // difference: it’s necessary to divide the whole circle in maxNumber parts. So, we should do 360º/maxNumber, which in radians is 2*pi/maxNumber;
        let difference = 2 * CGFloat.pi / CGFloat(maxNumber)
        // endAngle: the endAngle corresponds to the startAngle plus the currentValue multiplied by the corresponding angle for each unit;
        let endAngle = startAngle + CGFloat(currentNumber) * CGFloat(difference)
        
        // lineWidth: this is the desired width for the bar;
        let lineWidth: CGFloat = 10
        
        // bar: this creates the path, with the radius of the circle minus half the line’s width. This will ensure that you design the path inside the circle, so that when you draw it with the specified line width, the width of the path will match the circle’s limit.
        let bar = UIBezierPath(arcCenter: center, radius: bounds.width/2 -
        CGFloat(lineWidth / 2), startAngle: startAngle, endAngle: endAngle, clockwise:true)
        
        bar.lineWidth = lineWidth
        
        barColor.setStroke()
        bar.stroke()
    }
}
