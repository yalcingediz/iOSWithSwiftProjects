//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Berkant Y. GEDIZ on 5/16/17,20.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    var btnSound : AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    @IBAction func numberPressed(sender: UIButton) {
        playSounds()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(_ sender: Any) {
        playSounds()
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: Any) {
         playSounds()
         processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func onAddPressed(_ sender: Any) {
         playSounds()
         processOperation(operation: Operation.Add)
    }
    
    @IBAction func onSubtractPressed(_ sender: Any) {
         playSounds()
         processOperation(operation: Operation.Subtract)
    }
    
    @IBAction func onEqualPressed(_ sender: Any) {
         playSounds()
         processOperation(operation: currentOperation)
    }
  
    @IBAction func onClearPressed(_ sender: Any) {
        outputLbl.text = "0"
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        result = ""
        currentOperation = Operation.Empty
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                switch currentOperation {
                   case Operation.Add:
                       result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                   case Operation.Subtract:
                       result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                   case Operation.Multiply:
                       result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                   case Operation.Divide:
                       result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                   default:
                       outputLbl.text = "ERROR!"
                }
                leftValStr = result
                outputLbl.text = result
            }
            currentOperation = operation

        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
   
    func playSounds() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }

}

