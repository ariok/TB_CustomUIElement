//
//  BWGradientView.swift
//  TBUIComponent
//
//  Created by Yari D'areglia on 06/09/14.
//  Copyright (c) 2014 Yari D'areglia. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class BWGradientView: UIView {
    
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    
    
    // MARK: Overrides ******************************************
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        
        let colors:Array<AnyObject> = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)

        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as CAGradientLayer
    }
    
}
