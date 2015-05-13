//
//  ViewController.swift
//  Button
//
//  Created by Mohsin on 13/05/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    
    var animationLabel: KAProgressLabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        self.view.bringSubviewToFront(self.btnA)
        self.btnA.layer.cornerRadius = self.btnA.frame.width/2
        
        
        // configure KAProgress Label
        self.animationLabel = KAProgressLabel(frame: CGRect(x: 50, y: 50, width: 70, height: 70))
        self.animationLabel?.progressColor = UIColor.redColor()
        //self.animationLabel?.trackColor = UIColor.clearColor()

        self.animationLabel?.progressWidth = 3.0
        self.animationLabel?.trackWidth = 3.0
        
        self.view.addSubview(animationLabel!)

    }
    
    override func viewDidAppear(animated: Bool) {
        

        // set in round shape
        self.btnA.layer.cornerRadius = self.btnA.frame.width/2
        self.btnB.layer.cornerRadius = self.btnB.frame.width/2
        self.btnC.layer.cornerRadius = self.btnC.frame.width/2
        self.btnD.layer.cornerRadius = self.btnD.frame.width/2

        // initially set all button to center
        self.btnB.center = self.btnA.center
        self.btnC.center = self.btnA.center
        self.btnD.center = self.btnA.center
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func click(sender: UIButton) {
        
        self.animationA()
        
        
        self.animationLabel!.setProgress(0.7, timing: TPPropertyAnimationTimingEaseOut, duration: 0.5, delay: 0.0)
        
        self.animationLabel?.text = "40"
    }
    
    
    
    func animationA(){
        
        // check if its not colaps
        if self.btnA.frame.origin.y == self.btnB.frame.origin.y {
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                let YConstant = self.btnA.frame.origin.y
                
                self.btnB.frame.origin.y = YConstant - 70
                self.btnC.frame.origin.y = YConstant - 140
                self.btnD.frame.origin.y = YConstant - 210
                
                }) { (bool) -> Void in
                    println("complete")
            }
        }
        else {
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.btnB.center = self.btnA.center
                self.btnC.center = self.btnA.center
                self.btnD.center = self.btnA.center
            })
        }
        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            
//            
//            // check if its not colaps
//            if self.btnA.frame.origin.y == self.btnB.frame.origin.y {
//                let YConstant = self.btnA.frame.origin.y
//                
//                self.btnB.frame.origin.y = YConstant - 70
//                self.btnC.frame.origin.y = YConstant - 140
//                self.btnD.frame.origin.y = YConstant - 210
//            }
//            else{
//                self.btnB.center = self.btnA.center
//                self.btnC.center = self.btnA.center
//                self.btnD.center = self.btnA.center
//            }
//            
//            
//            
//            }) { (bool) -> Void in
//                println("complete")
//                
//        }
    }
    

}

