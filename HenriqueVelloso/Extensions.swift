//
//  Extensions.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/18/15.
//
//

import Foundation
import UIKit


//MARK: UIView

extension UIViewController {
    
    
    func setNavigationBarHeader(imageName:String) {
        
        var logoHeader : UIImageView = UIImageView(image: UIImage(named: imageName))
        self.navigationItem.titleView = logoHeader

    }
}

extension UIView {
    
    func addParallax( minimumRelativeValueX: AnyObject!, maximumRelativeValueX: AnyObject!, minimumRelativeValueY: AnyObject!, maximumRelativeValueY: AnyObject! ) {
        
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = minimumRelativeValueX
        verticalMotionEffect.maximumRelativeValue = maximumRelativeValueX
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = minimumRelativeValueY
        horizontalMotionEffect.maximumRelativeValue = maximumRelativeValueY
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        self.addMotionEffect(group)
        
        
    }
    
    func addParallax(minimumRelativeValue: AnyObject!, maximumRelativeValue: AnyObject!) {
        
        
        self.addParallax(minimumRelativeValue, maximumRelativeValueX: maximumRelativeValue, minimumRelativeValueY: minimumRelativeValue, maximumRelativeValueY: maximumRelativeValue)
        
    }
    
}


extension NSBundle {
    
    static func getXibNamed(xibName: String, owner: AnyObject!) -> AnyObject? {
        
        var arrayOfViews = NSBundle.mainBundle().loadNibNamed(xibName, owner: owner, options: nil)
        
        if (arrayOfViews.count < 1) {
            return nil
        }
        
        
        return arrayOfViews[0]
        
    }
    
}

extension UIImageView {
    
    func blurImage() {
        
            var blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
            var blurView = UIVisualEffectView(effect: blur)
            blurView.frame =  CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 800, 100) // self.bounds
            blurView.alpha = 0.3
            self.addSubview(blurView)
        
    }
    
    func blurImage(bounds: CGRect) {
        
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = bounds
        self.addSubview(blurView)
        
    }
    
}