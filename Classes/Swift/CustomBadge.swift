/*
CustomBadge.m

*** Description: ***
With this class you can draw a typical iOS badge indicator with a custom text on any view.
Please use the allocator customBadgeWithString to create a new badge.
In this version you can modfiy the color inside the badge (insetColor),
the color of the frame (frameColor), the color of the text and you can
tell the class if you want a frame around the badge.

*** License & Copyright ***
Created by Sascha Paulus www.spaulus.com on 04/2011. Version 2.0
This tiny class can be used for free in private and commercial applications.
Please feel free to modify, extend or distribution this class.
If you modify it: Please send me your modified version of the class.
Please do not sell the source code solely and keep this text in
your copyright section. Thanks.

If you have any questions please feel free to contact me (open@spaulus.com).

*/

import UIKit

class CustomBadge: UIControl {
    
    var badgeText : String  = ""
    var badgeTextColor : UIColor = UIColor.blackColor()
    var badgeInsetColor : UIColor = UIColor.blackColor()
    var badgeFrameColor : UIColor = UIColor.blackColor()
    var badgeFrame : Bool = false;
    var badgeCornerRoundness : CGFloat = 1.0
    var badgeScaleFactor : CGFloat = 1.0
    var badgeShining : Bool = false
    
    var objectTag : AnyObject?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // I recommend to use the allocator customBadgeWithString
    init(badgeString: String, frame: CGRect, scale: Float, shining: Bool) {
        super.init(frame: frame)
    
        setUp(badgeString: badgeString, stringColor: UIColor.whiteColor(), insetColor: UIColor.redColor(), hasBadgeFrame: true,
            frameColor: UIColor.whiteColor(), scale: scale, shining: shining)
    }
    
    init(badgeString: String, frame: CGRect, stringColor: UIColor, insetColor: UIColor, hasBadgeFrame: Bool, frameColor: UIColor,
        scale: Float, shining: Bool) {
        super.init(frame: frame)
        
        setUp(badgeString: badgeString, stringColor: stringColor, insetColor: insetColor, hasBadgeFrame: hasBadgeFrame, frameColor: frameColor, scale: scale, shining: shining)
    }
    
    func setUp(#badgeString: String, stringColor: UIColor, insetColor: UIColor, hasBadgeFrame: Bool, frameColor: UIColor,
        scale: Float, shining: Bool) {
        
        self.contentScaleFactor = UIScreen.mainScreen().scale
        self.backgroundColor = UIColor.clearColor()
        self.badgeText = badgeString
        self.badgeTextColor = stringColor
        self.badgeFrame = hasBadgeFrame;
        self.badgeFrameColor = frameColor
        self.badgeInsetColor = insetColor
        self.badgeCornerRoundness = CGFloat(0.4)
        self.badgeScaleFactor = CGFloat(scale)
        self.badgeShining = shining
        self.autoBadgeSize(badgeString)
    }
    
    // Use this method if you want to change the badge text after the first rendering
    func autoBadgeSize(badgeString: String) {
        var retValue : CGSize
        var rectWidth, rectHeight : CGFloat
        var stringSize = (badgeString as NSString).sizeWithAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(12)])
        var flexSpace : CGFloat
        
        let badgeStringLength = (badgeString as NSString).length
        
        if (badgeStringLength >= 2) {
            flexSpace = CGFloat(badgeStringLength)
            rectWidth = 25 + (stringSize.width + flexSpace);
            rectHeight = CGFloat(25);
            
            retValue = CGSizeMake(CGFloat(rectWidth * badgeScaleFactor), CGFloat(rectHeight * badgeScaleFactor));
        } else {
            retValue = CGSizeMake(25 * badgeScaleFactor, 25 * badgeScaleFactor);
        }
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height)
        self.badgeText = badgeString
        self.setNeedsDisplay()
    }
    
    
    // Creates a Badge with a given Text
    class func customBadge(badgeString: String, frame: CGRect) -> CustomBadge {
        return CustomBadge(badgeString: badgeString, frame: frame, scale: 1.0, shining: true)
    }
    
    
    // Creates a Badge with a given Text, Text Color, Inset Color, Frame (YES/NO) and Frame Color
    class func customBadge(badgeString: String, frame: CGRect, stringColor: UIColor, insetColor: UIColor, hasBadgeFrame: Bool,
        badgeFrameColor: UIColor, scale: Float, shining: Bool) -> CustomBadge {
            
            return CustomBadge(badgeString: badgeString, frame: frame, stringColor: stringColor, insetColor: insetColor,
                hasBadgeFrame: hasBadgeFrame, frameColor: badgeFrameColor, scale: scale, shining: shining)
    }
    
    
    
    
    
    // Draws the Badge with Quartz
    func drawRoundedRect(context: CGContextRef, rect: CGRect) {
        CGContextSaveGState(context)
    
        let radius = CGRectGetMaxY(rect) * badgeCornerRoundness
        let puffer = CGRectGetMaxY(rect) * 0.10
        let maxX = CGRectGetMaxX(rect) - puffer
        let maxY = CGRectGetMaxY(rect) - puffer
        let minX = CGRectGetMinX(rect) + puffer
        let minY = CGRectGetMinY(rect) + puffer
    
        CGContextBeginPath(context)
        CGContextSetFillColorWithColor(context, badgeInsetColor.CGColor)
        
        CGContextAddArc(context, maxX - radius, minY + radius,
            radius, CGFloat(M_PI + (M_PI / 2)), 0, 0)
        
        CGContextAddArc(context, maxX - radius, maxY - radius, radius, 0, CGFloat(M_PI / 2), 0)
        
        CGContextAddArc(context, minX + radius, maxY - radius, radius, CGFloat(M_PI / 2), CGFloat(M_PI), 0)
        
        CGContextAddArc(context, minX + radius, minY + radius, radius, CGFloat(M_PI), CGFloat(M_PI + M_PI / 2), 0)
        
        CGContextSetShadowWithColor(context, CGSizeMake(1.0, 1.0), 3, UIColor.blackColor().CGColor)
        CGContextFillPath(context)
    
        CGContextRestoreGState(context)
    }
    
    // Draws the Badge Shine with Quartz
    func drawShine(context: CGContextRef, rect: CGRect) {
    
        CGContextSaveGState(context)
    
        let radius = CGRectGetMaxY(rect) * badgeCornerRoundness
        let puffer = CGRectGetMaxY(rect) * 0.10
        let maxX = CGRectGetMaxX(rect) - puffer
        let maxY = CGRectGetMaxY(rect) - puffer
        let minX = CGRectGetMinX(rect) + puffer
        let minY = CGRectGetMinY(rect) + puffer
        
        CGContextBeginPath(context)
        
        CGContextAddArc(context, maxX - radius, minY + radius, radius, CGFloat(M_PI + (M_PI / 2)), 0, 0)
        
        CGContextAddArc(context, maxX - radius, maxY - radius, radius, 0, CGFloat(M_PI / 2), 0)
        
        CGContextAddArc(context, minX + radius, maxY - radius, radius, CGFloat(M_PI / 2), CGFloat(M_PI), 0)
        
        CGContextAddArc(context, minX + radius, minY + radius, radius, CGFloat(M_PI), CGFloat(M_PI + M_PI / 2), 0)
        
        CGContextClip(context)
    
        let num_locations = size_t(2)
        let locations : [CGFloat] = [ 0.0, 0.4 ]
        let components : [CGFloat] = [0.92, 0.92, 0.92, 1.0, 0.82, 0.82, 0.82, 0.4]
    
        let cspace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColorComponents(cspace, components, locations, num_locations)
    
        let sPoint = CGPoint(x: 0, y: 0)
        let ePoint = CGPoint(x: 0, y: maxY)
        
        CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0)
    
        CGContextRestoreGState(context)
    }
    
    
    // Draws the Badge Frame with Quartz
    func drawFrame(context: CGContextRef, rect: CGRect) {
        
        let radius = CGRectGetMaxY(rect) * badgeCornerRoundness
        let puffer = CGRectGetMaxY(rect) * 0.10
    
        let maxX = CGRectGetMaxX(rect) - puffer
        let maxY = CGRectGetMaxY(rect) - puffer
        let minX = CGRectGetMinX(rect) + puffer
        let minY = CGRectGetMinY(rect) + puffer
    
    
        CGContextBeginPath(context)
        var lineSize = CGFloat(2)
        
        if (badgeScaleFactor > 1) {
            lineSize += badgeScaleFactor * 0.25
        }
        
        CGContextSetLineWidth(context, lineSize)
        CGContextSetStrokeColorWithColor(context, badgeFrameColor.CGColor)
        CGContextAddArc(context, maxX - radius, minY + radius, radius, CGFloat(M_PI + (M_PI / 2)), 0, 0)
        CGContextAddArc(context, maxX - radius, maxY - radius, radius, 0, CGFloat(M_PI / 2), 0)
        CGContextAddArc(context, minX + radius, maxY - radius, radius, CGFloat(M_PI / 2), CGFloat(M_PI), 0)
        CGContextAddArc(context, minX + radius, minY + radius, radius, CGFloat(M_PI), CGFloat(M_PI + M_PI / 2), 0)
        
        CGContextClosePath(context)
        CGContextStrokePath(context)
    }
    
    
    override func drawRect(rect: CGRect) {
    
        let context = UIGraphicsGetCurrentContext()
        drawRoundedRect(context, rect: rect)
    
        if (badgeShining) {
            drawShine(context, rect:rect)
        }
    
        if (badgeFrame)  {
            drawFrame(context, rect:rect)
        }
    
        if ((badgeText as NSString).length > 0) {
            
            badgeTextColor.set()
            
            var sizeOfFont = 13.5 * badgeScaleFactor
            
            if ((badgeText as NSString).length < 2) {
                sizeOfFont += sizeOfFont * 0.20;
            }
            
            let textFont = UIFont.boldSystemFontOfSize(sizeOfFont)
            
            let textSize = (badgeText as NSString).sizeWithAttributes([NSFontAttributeName: textFont])
            
            (badgeText as NSString).drawAtPoint(CGPointMake((rect.size.width/2-textSize.width/2), (rect.size.height/2-textSize.height/2)), withAttributes: [NSFontAttributeName: textFont])
        }
    
    }

}
