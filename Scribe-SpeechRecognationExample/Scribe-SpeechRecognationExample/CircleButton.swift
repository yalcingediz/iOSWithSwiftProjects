//
//  CircleButton.swift
//  Scribe-SpeechRecognationExample
//
//  Created by Berkant Y. GEDIZ on 6/18/17,25.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    @IBInspectable var cornerRadius:CGFloat = 30.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
