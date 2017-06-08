//
//  ViewController.swift
//  MVC-Test
//
//  Created by Berkant Y. GEDIZ on 5/23/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var renameField: UITextField!
    
    let person = Person(first: "Berkant", last: "Yalcingediz")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fullName.text = person.fullName
    }

    @IBAction func renameButtonPressed(_ sender: Any) {
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }

}

