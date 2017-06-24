//
//  ViewController.swift
//  PushMyNotification
//
//  Created by Berkant Y. GEDIZ on 6/21/17,25.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Messaging.messaging().subscribe(toTopic: "/topics/news")
    }

}

