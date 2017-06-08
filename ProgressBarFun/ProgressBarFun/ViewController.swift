//
//  ViewController.swift
//  ProgressBarFun
//
//  Created by Berkant Y. GEDIZ on 5/24/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBarView: ProgressBarView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderMoved(_ sender: Any) {
        print("ViewController:sliderMoved: BEGIN")
        progressBarView.progress = CGFloat(slider.value)
        print("ViewController:sliderMoved: END")

    }

}

