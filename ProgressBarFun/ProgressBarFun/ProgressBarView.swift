//
//  ProgressBarView.swift
//  ProgressBarFun
//
//  Created by Berkant Y. GEDIZ on 5/24/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {

    private var _innerProgress: CGFloat = 0.0
    
    var progress:CGFloat {
        get {
            return _innerProgress * bounds.width
        }
        set (newProgress) {
            if newProgress >= 1.0 {
                _innerProgress = 1.0
            } else if newProgress < 0.0 {
                _innerProgress = 0.0
            } else {
                _innerProgress = newProgress
            }
            setNeedsDisplay()
        }
    }

    
    override func draw(_ rect: CGRect) {
        // Drawing code
        print("ProgressBarView:draw: BEGIN")
        ProgressBarDraw.drawProgressBar(frame: bounds, progress: progress)
        print("ProgressBarView:draw: END")
    }
    
}
