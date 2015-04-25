//
//  WelcomeViewController.swift
//  HenriqueVelloso
//
//  Created by Henrique Velloso on 4/17/15.
//
//

import UIKit

class WelcomeViewController: UIViewController {


  
    @IBOutlet weak var parallaxView: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bgImage.addParallax(-30,maximumRelativeValueX: 30, minimumRelativeValueY: -400,maximumRelativeValueY: 400)
        parallaxView.addParallax(30, maximumRelativeValue: -30)
        
        
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)


    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
     
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Up:
                self.dismissViewControllerAnimated(true, completion: nil)
            default:
                break
            }
        }
        
    }
    
    
    
    


}
