//
//  FeedVC.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 7/6/17,27.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func singOutButtonPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        if KeychainWrapper.standard.removeObject(forKey: KEY_UID) != true {
            print("FAILURE - Could not remove/delete id from Keychain")
        } else {
           print("SUCCESS - Removed id from Keychain")
        }
        
        try! firebaseAuth.signOut()
        
        performSegue(withIdentifier: SEGUE_ID_FROM_FEED_VC_TO_SIGN_IN_VC, sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
