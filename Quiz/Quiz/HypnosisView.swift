//
//  HypnosisView.swift
//  Quiz
//
//  Created by Alex Flores on 12/15/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class HypnosisView: UIView {
    
    var radiusOffset: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var timer: NSTimer?
    let logoImage: UIImage? = UIImage(named: "hyp.png")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // All HypnosisViews start with a clear background color
        backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
    override func didMoveToSuperview() {
        if superview != nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0/30.0,
            target: self,
            selector: "timerFired:",
            userInfo: nil,
            repeats: true)
        }
    }
    
    override func removeFromSuperview() {
            timer?.invalidate()
            timer = nil
            super.removeFromSuperview()
    }

    
    func timerFired(timer: NSTimer) {
        // Increment the radius offset
        radiusOffset += 1.0
        // Reset the radius offset at 20 to create a nice, looping effect
        if radiusOffset > 20 {
        radiusOffset = 0
        }
    }

    
    override func drawRect(rect: CGRect) {
        let bounds = self.bounds
        // Figure out the center of the bounds rectangle
        let centerX = bounds.origin.x + bounds.size.width / 2.0
        let centerY = bounds.origin.y + bounds.size.height / 2.0
        let center = CGPoint(x: centerX, y: centerY)
        
        // The largest circle will circumscribe the view
        let maxRadius =
        CGFloat(hypot(CDouble(bounds.size.width), CDouble(bounds.size.height)) / 2.0)
        
        // Keep drawing bigger circles until the radius is
        // larger than the maximum visible radius
        
        logoImage?.drawInRect(rect)

        
        for var radius: CGFloat = 0.0; radius < maxRadius; radius += 20 {
        
            let path = UIBezierPath()
        
            path.addArcWithCenter(center, radius: radius + radiusOffset, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
            path.lineWidth = CGFloat(10.0)
            let alpha = ((radius + radiusOffset - 10) / maxRadius)
            UIColor.blueColor().colorWithAlphaComponent(alpha).setStroke()
            path.stroke()
        }
        
    }


}
