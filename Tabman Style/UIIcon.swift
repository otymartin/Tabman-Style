//
//  UIIcon.swift
//
//  Created by Martin Otyeka on Jun 4, 2018.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//
//  Generated by PaintCode Plugin for Sketch
//  http://www.paintcodeapp.com/sketch
//

import UIKit



class UIIcon: NSObject {
    
    
    //MARK: - Canvas Drawings
    
    /// Page 1
    
    class func drawInvitationCardSmall(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 18, height: 14), resizing: ResizingBehavior = .aspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 18, height: 14), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 18, y: resizedFrame.height / 14)
        
        /// envelope
        do {
            context.saveGState()
            context.translateBy(x: 1, y: 1)
            
            /// Shape
            let shape = UIBezierPath()
            shape.move(to: CGPoint(x: 15.7, y: 3.96))
            shape.addCurve(to: CGPoint(x: 16, y: 4.11), controlPoint1: CGPoint(x: 15.82, y: 3.87), controlPoint2: CGPoint(x: 16, y: 3.96))
            shape.addLine(to: CGPoint(x: 16, y: 10.5))
            shape.addCurve(to: CGPoint(x: 14.5, y: 12), controlPoint1: CGPoint(x: 16, y: 11.33), controlPoint2: CGPoint(x: 15.33, y: 12))
            shape.addLine(to: CGPoint(x: 1.5, y: 12))
            shape.addCurve(to: CGPoint(x: 0, y: 10.5), controlPoint1: CGPoint(x: 0.67, y: 12), controlPoint2: CGPoint(x: 0, y: 11.33))
            shape.addLine(to: CGPoint(x: 0, y: 4.11))
            shape.addCurve(to: CGPoint(x: 0.3, y: 3.97), controlPoint1: CGPoint(x: 0, y: 3.96), controlPoint2: CGPoint(x: 0.18, y: 3.87))
            shape.addCurve(to: CGPoint(x: 5.12, y: 7.52), controlPoint1: CGPoint(x: 1, y: 4.51), controlPoint2: CGPoint(x: 1.93, y: 5.2))
            shape.addCurve(to: CGPoint(x: 8, y: 9), controlPoint1: CGPoint(x: 5.78, y: 8), controlPoint2: CGPoint(x: 6.89, y: 9.01))
            shape.addCurve(to: CGPoint(x: 10.88, y: 7.52), controlPoint1: CGPoint(x: 9.12, y: 9.01), controlPoint2: CGPoint(x: 10.25, y: 7.98))
            shape.addCurve(to: CGPoint(x: 15.7, y: 3.96), controlPoint1: CGPoint(x: 14.07, y: 5.2), controlPoint2: CGPoint(x: 15, y: 4.51))
            shape.close()
            shape.move(to: CGPoint(x: 8, y: 8))
            shape.addCurve(to: CGPoint(x: 10.29, y: 6.71), controlPoint1: CGPoint(x: 8.73, y: 8.01), controlPoint2: CGPoint(x: 9.77, y: 7.09))
            shape.addCurve(to: CGPoint(x: 15.71, y: 2.68), controlPoint1: CGPoint(x: 14.44, y: 3.7), controlPoint2: CGPoint(x: 14.76, y: 3.43))
            shape.addCurve(to: CGPoint(x: 16, y: 2.09), controlPoint1: CGPoint(x: 15.89, y: 2.54), controlPoint2: CGPoint(x: 16, y: 2.32))
            shape.addLine(to: CGPoint(x: 16, y: 1.5))
            shape.addCurve(to: CGPoint(x: 14.5, y: 0), controlPoint1: CGPoint(x: 16, y: 0.67), controlPoint2: CGPoint(x: 15.33, y: 0))
            shape.addLine(to: CGPoint(x: 1.5, y: 0))
            shape.addCurve(to: CGPoint(x: 0, y: 1.5), controlPoint1: CGPoint(x: 0.67, y: 0), controlPoint2: CGPoint(x: 0, y: 0.67))
            shape.addLine(to: CGPoint(x: 0, y: 2.09))
            shape.addCurve(to: CGPoint(x: 0.29, y: 2.68), controlPoint1: CGPoint(x: 0, y: 2.32), controlPoint2: CGPoint(x: 0.11, y: 2.54))
            shape.addCurve(to: CGPoint(x: 5.71, y: 6.71), controlPoint1: CGPoint(x: 1.24, y: 3.43), controlPoint2: CGPoint(x: 1.56, y: 3.7))
            shape.addCurve(to: CGPoint(x: 8, y: 8), controlPoint1: CGPoint(x: 6.23, y: 7.09), controlPoint2: CGPoint(x: 7.27, y: 8.01))
            shape.close()
            context.saveGState()
            UIColor(hue: 0.588, saturation: 0.125, brightness: 0.596, alpha: 1).setFill()
            shape.fill()
            context.restoreGState()
            
            context.restoreGState()
        }
        
        context.restoreGState()
    }
    
    class func drawBadge18Opaque(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 16), resizing: ResizingBehavior = .aspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 16, height: 16), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 16, y: resizedFrame.height / 16)
        
        /// Group
        do {
            context.saveGState()
            
            /// Shape
            let shape = UIBezierPath()
            shape.move(to: CGPoint(x: 15.57, y: 7.24))
            shape.addCurve(to: CGPoint(x: 15.57, y: 8.76), controlPoint1: CGPoint(x: 16.14, y: 7.58), controlPoint2: CGPoint(x: 16.14, y: 8.41))
            shape.addLine(to: CGPoint(x: 15.01, y: 9.09))
            shape.addCurve(to: CGPoint(x: 14.54, y: 9.74), controlPoint1: CGPoint(x: 14.77, y: 9.24), controlPoint2: CGPoint(x: 14.61, y: 9.47))
            shape.addCurve(to: CGPoint(x: 14.53, y: 9.75), controlPoint1: CGPoint(x: 14.54, y: 9.74), controlPoint2: CGPoint(x: 14.53, y: 9.75))
            shape.addCurve(to: CGPoint(x: 14.62, y: 10.56), controlPoint1: CGPoint(x: 14.46, y: 10.03), controlPoint2: CGPoint(x: 14.48, y: 10.31))
            shape.addLine(to: CGPoint(x: 14.93, y: 11.13))
            shape.addCurve(to: CGPoint(x: 14.18, y: 12.44), controlPoint1: CGPoint(x: 15.26, y: 11.71), controlPoint2: CGPoint(x: 14.84, y: 12.43))
            shape.addLine(to: CGPoint(x: 13.52, y: 12.45))
            shape.addCurve(to: CGPoint(x: 12.78, y: 12.78), controlPoint1: CGPoint(x: 13.24, y: 12.46), controlPoint2: CGPoint(x: 12.98, y: 12.58))
            shape.addCurve(to: CGPoint(x: 12.78, y: 12.78), controlPoint1: CGPoint(x: 12.78, y: 12.78), controlPoint2: CGPoint(x: 12.78, y: 12.78))
            shape.addCurve(to: CGPoint(x: 12.45, y: 13.52), controlPoint1: CGPoint(x: 12.58, y: 12.98), controlPoint2: CGPoint(x: 12.46, y: 13.24))
            shape.addLine(to: CGPoint(x: 12.44, y: 14.18))
            shape.addCurve(to: CGPoint(x: 11.13, y: 14.93), controlPoint1: CGPoint(x: 12.43, y: 14.84), controlPoint2: CGPoint(x: 11.71, y: 15.26))
            shape.addLine(to: CGPoint(x: 10.56, y: 14.62))
            shape.addCurve(to: CGPoint(x: 9.75, y: 14.53), controlPoint1: CGPoint(x: 10.31, y: 14.48), controlPoint2: CGPoint(x: 10.02, y: 14.46))
            shape.addCurve(to: CGPoint(x: 9.74, y: 14.54), controlPoint1: CGPoint(x: 9.75, y: 14.54), controlPoint2: CGPoint(x: 9.74, y: 14.54))
            shape.addCurve(to: CGPoint(x: 9.09, y: 15.01), controlPoint1: CGPoint(x: 9.47, y: 14.61), controlPoint2: CGPoint(x: 9.23, y: 14.77))
            shape.addLine(to: CGPoint(x: 8.76, y: 15.57))
            shape.addCurve(to: CGPoint(x: 7.24, y: 15.57), controlPoint1: CGPoint(x: 8.41, y: 16.14), controlPoint2: CGPoint(x: 7.58, y: 16.14))
            shape.addLine(to: CGPoint(x: 6.91, y: 15.01))
            shape.addCurve(to: CGPoint(x: 6.26, y: 14.54), controlPoint1: CGPoint(x: 6.76, y: 14.77), controlPoint2: CGPoint(x: 6.53, y: 14.61))
            shape.addCurve(to: CGPoint(x: 6.24, y: 14.53), controlPoint1: CGPoint(x: 6.25, y: 14.54), controlPoint2: CGPoint(x: 6.25, y: 14.54))
            shape.addCurve(to: CGPoint(x: 5.44, y: 14.62), controlPoint1: CGPoint(x: 5.97, y: 14.46), controlPoint2: CGPoint(x: 5.69, y: 14.48))
            shape.addLine(to: CGPoint(x: 4.87, y: 14.93))
            shape.addCurve(to: CGPoint(x: 3.56, y: 14.18), controlPoint1: CGPoint(x: 4.29, y: 15.26), controlPoint2: CGPoint(x: 3.57, y: 14.84))
            shape.addLine(to: CGPoint(x: 3.55, y: 13.52))
            shape.addCurve(to: CGPoint(x: 3.22, y: 12.78), controlPoint1: CGPoint(x: 3.54, y: 13.24), controlPoint2: CGPoint(x: 3.42, y: 12.98))
            shape.addCurve(to: CGPoint(x: 3.22, y: 12.78), controlPoint1: CGPoint(x: 3.22, y: 12.78), controlPoint2: CGPoint(x: 3.22, y: 12.78))
            shape.addCurve(to: CGPoint(x: 2.48, y: 12.45), controlPoint1: CGPoint(x: 3.02, y: 12.58), controlPoint2: CGPoint(x: 2.76, y: 12.46))
            shape.addLine(to: CGPoint(x: 1.82, y: 12.44))
            shape.addCurve(to: CGPoint(x: 1.06, y: 11.13), controlPoint1: CGPoint(x: 1.16, y: 12.43), controlPoint2: CGPoint(x: 0.74, y: 11.71))
            shape.addLine(to: CGPoint(x: 1.38, y: 10.56))
            shape.addCurve(to: CGPoint(x: 1.46, y: 9.75), controlPoint1: CGPoint(x: 1.52, y: 10.31), controlPoint2: CGPoint(x: 1.54, y: 10.02))
            shape.addCurve(to: CGPoint(x: 1.46, y: 9.74), controlPoint1: CGPoint(x: 1.46, y: 9.75), controlPoint2: CGPoint(x: 1.46, y: 9.74))
            shape.addCurve(to: CGPoint(x: 0.99, y: 9.09), controlPoint1: CGPoint(x: 1.39, y: 9.47), controlPoint2: CGPoint(x: 1.23, y: 9.24))
            shape.addLine(to: CGPoint(x: 0.43, y: 8.76))
            shape.addCurve(to: CGPoint(x: 0.43, y: 7.24), controlPoint1: CGPoint(x: -0.14, y: 8.41), controlPoint2: CGPoint(x: -0.14, y: 7.58))
            shape.addLine(to: CGPoint(x: 0.99, y: 6.91))
            shape.addCurve(to: CGPoint(x: 1.46, y: 6.26), controlPoint1: CGPoint(x: 1.23, y: 6.76), controlPoint2: CGPoint(x: 1.39, y: 6.53))
            shape.addCurve(to: CGPoint(x: 1.46, y: 6.24), controlPoint1: CGPoint(x: 1.46, y: 6.25), controlPoint2: CGPoint(x: 1.46, y: 6.25))
            shape.addCurve(to: CGPoint(x: 1.38, y: 5.44), controlPoint1: CGPoint(x: 1.54, y: 5.97), controlPoint2: CGPoint(x: 1.52, y: 5.69))
            shape.addLine(to: CGPoint(x: 1.06, y: 4.87))
            shape.addCurve(to: CGPoint(x: 1.82, y: 3.56), controlPoint1: CGPoint(x: 0.74, y: 4.29), controlPoint2: CGPoint(x: 1.15, y: 3.57))
            shape.addLine(to: CGPoint(x: 2.48, y: 3.55))
            shape.addCurve(to: CGPoint(x: 3.22, y: 3.22), controlPoint1: CGPoint(x: 2.76, y: 3.54), controlPoint2: CGPoint(x: 3.02, y: 3.42))
            shape.addCurve(to: CGPoint(x: 3.22, y: 3.21), controlPoint1: CGPoint(x: 3.22, y: 3.22), controlPoint2: CGPoint(x: 3.22, y: 3.22))
            shape.addCurve(to: CGPoint(x: 3.55, y: 2.48), controlPoint1: CGPoint(x: 3.42, y: 3.02), controlPoint2: CGPoint(x: 3.54, y: 2.76))
            shape.addLine(to: CGPoint(x: 3.56, y: 1.82))
            shape.addCurve(to: CGPoint(x: 4.87, y: 1.06), controlPoint1: CGPoint(x: 3.57, y: 1.15), controlPoint2: CGPoint(x: 4.29, y: 0.74))
            shape.addLine(to: CGPoint(x: 5.44, y: 1.38))
            shape.addCurve(to: CGPoint(x: 6.25, y: 1.46), controlPoint1: CGPoint(x: 5.69, y: 1.52), controlPoint2: CGPoint(x: 5.98, y: 1.54))
            shape.addCurve(to: CGPoint(x: 6.26, y: 1.46), controlPoint1: CGPoint(x: 6.25, y: 1.46), controlPoint2: CGPoint(x: 6.25, y: 1.46))
            shape.addCurve(to: CGPoint(x: 6.91, y: 0.99), controlPoint1: CGPoint(x: 6.53, y: 1.39), controlPoint2: CGPoint(x: 6.76, y: 1.23))
            shape.addLine(to: CGPoint(x: 7.24, y: 0.43))
            shape.addCurve(to: CGPoint(x: 8.76, y: 0.43), controlPoint1: CGPoint(x: 7.59, y: -0.14), controlPoint2: CGPoint(x: 8.42, y: -0.14))
            shape.addLine(to: CGPoint(x: 9.09, y: 0.99))
            shape.addCurve(to: CGPoint(x: 9.74, y: 1.46), controlPoint1: CGPoint(x: 9.24, y: 1.23), controlPoint2: CGPoint(x: 9.47, y: 1.39))
            shape.addCurve(to: CGPoint(x: 9.75, y: 1.46), controlPoint1: CGPoint(x: 9.74, y: 1.46), controlPoint2: CGPoint(x: 9.75, y: 1.46))
            shape.addCurve(to: CGPoint(x: 10.56, y: 1.38), controlPoint1: CGPoint(x: 10.03, y: 1.54), controlPoint2: CGPoint(x: 10.31, y: 1.52))
            shape.addLine(to: CGPoint(x: 11.13, y: 1.06))
            shape.addCurve(to: CGPoint(x: 12.44, y: 1.82), controlPoint1: CGPoint(x: 11.71, y: 0.74), controlPoint2: CGPoint(x: 12.43, y: 1.15))
            shape.addLine(to: CGPoint(x: 12.45, y: 2.48))
            shape.addCurve(to: CGPoint(x: 12.78, y: 3.22), controlPoint1: CGPoint(x: 12.46, y: 2.76), controlPoint2: CGPoint(x: 12.58, y: 3.02))
            shape.addCurve(to: CGPoint(x: 12.78, y: 3.22), controlPoint1: CGPoint(x: 12.78, y: 3.22), controlPoint2: CGPoint(x: 12.78, y: 3.22))
            shape.addCurve(to: CGPoint(x: 13.52, y: 3.55), controlPoint1: CGPoint(x: 12.98, y: 3.42), controlPoint2: CGPoint(x: 13.24, y: 3.54))
            shape.addLine(to: CGPoint(x: 14.18, y: 3.56))
            shape.addCurve(to: CGPoint(x: 14.94, y: 4.87), controlPoint1: CGPoint(x: 14.84, y: 3.57), controlPoint2: CGPoint(x: 15.26, y: 4.29))
            shape.addLine(to: CGPoint(x: 14.62, y: 5.44))
            shape.addCurve(to: CGPoint(x: 14.54, y: 6.25), controlPoint1: CGPoint(x: 14.48, y: 5.69), controlPoint2: CGPoint(x: 14.46, y: 5.98))
            shape.addCurve(to: CGPoint(x: 14.54, y: 6.26), controlPoint1: CGPoint(x: 14.54, y: 6.25), controlPoint2: CGPoint(x: 14.54, y: 6.26))
            shape.addCurve(to: CGPoint(x: 15.01, y: 6.91), controlPoint1: CGPoint(x: 14.61, y: 6.53), controlPoint2: CGPoint(x: 14.77, y: 6.76))
            shape.addLine(to: CGPoint(x: 15.57, y: 7.24))
            shape.close()
            shape.move(to: CGPoint(x: 11.51, y: 6.59))
            shape.addCurve(to: CGPoint(x: 11.51, y: 5.72), controlPoint1: CGPoint(x: 11.75, y: 6.35), controlPoint2: CGPoint(x: 11.75, y: 5.96))
            shape.addCurve(to: CGPoint(x: 10.64, y: 5.72), controlPoint1: CGPoint(x: 11.27, y: 5.48), controlPoint2: CGPoint(x: 10.88, y: 5.48))
            shape.addLine(to: CGPoint(x: 7.04, y: 9.32))
            shape.addLine(to: CGPoint(x: 5.35, y: 7.63))
            shape.addCurve(to: CGPoint(x: 4.48, y: 7.63), controlPoint1: CGPoint(x: 5.11, y: 7.39), controlPoint2: CGPoint(x: 4.72, y: 7.39))
            shape.addCurve(to: CGPoint(x: 4.48, y: 8.5), controlPoint1: CGPoint(x: 4.24, y: 7.87), controlPoint2: CGPoint(x: 4.24, y: 8.26))
            shape.addLine(to: CGPoint(x: 6.6, y: 10.63))
            shape.addCurve(to: CGPoint(x: 7.04, y: 10.81), controlPoint1: CGPoint(x: 6.72, y: 10.74), controlPoint2: CGPoint(x: 6.88, y: 10.81))
            shape.addCurve(to: CGPoint(x: 7.47, y: 10.63), controlPoint1: CGPoint(x: 7.2, y: 10.81), controlPoint2: CGPoint(x: 7.36, y: 10.74))
            shape.addLine(to: CGPoint(x: 11.51, y: 6.59))
            shape.close()
            context.saveGState()
            context.translateBy(x: 0, y: 0)
            UIColor(hue: 0.556, saturation: 1, brightness: 1, alpha: 1).setFill()
            shape.fill()
            context.restoreGState()
            
            context.restoreGState()
        }
        
        context.restoreGState()
    }
    
    
    //MARK: - Canvas Images
    
    /// Page 1
    
    class func imageOfInvitationCardSmall() -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 18, height: 14), false, 0)
        UIIcon.drawInvitationCardSmall()
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    class func imageOfBadge18Opaque() -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 16, height: 16), false, 0)
        UIIcon.drawBadge18Opaque()
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    
    //MARK: - Resizing Behavior
    
    enum ResizingBehavior {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
    
    
}