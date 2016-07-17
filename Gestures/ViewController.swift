//
//  ViewController.swift
//  Gestures
//
//  Created by Admin on 17.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(_:)))
        let scaleGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.scaleGesture(_:)))
        
        imageView.gestureRecognizers = [panGesture, scaleGesture]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scaleGesture(gesture : UIPinchGestureRecognizer) {
        switch gesture.state {
        case .Changed, .Ended:
            let scale = gesture.scale
            let transform = CGAffineTransformMakeScale(scale, scale)
            let frame = CGRectApplyAffineTransform(imageView.bounds, transform)
            imageView.bounds = frame
            
            gesture.scale = 1
        default: break
        }
    }
    
    func panGesture(gesture : UIPanGestureRecognizer) {
        switch gesture.state {
            case .Changed, .Ended:
            let translation = gesture.translationInView(imageView)
            imageView.center = CGPoint(
                x: imageView.center.x + translation.x,
                y: imageView.center.y + translation.y)
            gesture.setTranslation(CGPointZero, inView: imageView)
            
            default: break
        }
    }
    
    @IBAction func swipeGesture(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("swipeSegue", sender: nil)
    }
}

