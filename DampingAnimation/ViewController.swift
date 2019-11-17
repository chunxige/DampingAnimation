//
//  ViewController.swift
//  DampingAnimation
//
//  Created by chunxi on 2019/11/16.
//  Copyright © 2019 chunxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dampSlider: UISlider!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var velocityValueLabel: UILabel!
    @IBOutlet weak var dampingValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var thumbView: UIButton!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    var animationOptions: [UIView.AnimationOptions] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dampChangedValue(dampSlider)
        velocityChangedValue(velocitySlider)
        durationChangedValue(durationSlider)
    }


    @IBAction func dampChangedValue(_ sender: UISlider) {
        dampingValueLabel.text = "\(sender.value)"
    }
    
    @IBAction func velocityChangedValue(_ sender: UISlider) {
        velocityValueLabel.text = "\(sender.value)"
    }
    
    @IBAction func durationChangedValue(_ sender: UISlider) {
        durationValueLabel.text = "\(sender.value)"
    }
    
    @IBAction func thumbViewAction(_ sender: Any) {
        startAnimation(duration: durationSlider.value, velocity: velocitySlider.value, damping: dampSlider.value)
    }
    
    func startAnimation(duration: Float, velocity: Float, damping: Float) {
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, usingSpringWithDamping: CGFloat(damping), initialSpringVelocity: CGFloat(velocity), options: .curveEaseInOut, animations: {
            self.changeThumbViewPosition()
        }) { (_) in
            
        }
    }
    
    func changeThumbViewPosition() {
        var f = thumbView.frame
        if f.maxY == bottomLine.frame.minY  {
            f.origin.y = topLine.frame.maxY
        } else {
            f.origin.y = bottomLine.frame.minY - f.height
        }
        thumbView.frame = f
    }
    
}

