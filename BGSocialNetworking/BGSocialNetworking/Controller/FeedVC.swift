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

class FeedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Implement for UITableViewDataSource: START
    // numberOfSections(in tableView is normally optional and when it not implemented it defaul;t section is 1 anyway
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL_ID, for: indexPath)
        
        return cell
    }
     // Implement for UITableViewDataSource: END
    
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
