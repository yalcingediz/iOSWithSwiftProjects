//
//  ViewController.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 6/24/17,25.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var FacebookLoginButton: SocialSignInButton!
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let loginButton = 
    }
    
    @IBAction func FacebookLoginButtonPressed(_ sender: SocialSignInButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("ERROR: Facebook authenication failed!")
            } else if result?.isCancelled == true {
                print("WARNING: Facebook authenication cancelled")
            } else {
                let fbloginresult = result!
                if fbloginresult.grantedPermissions != nil {
                    
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        //fbLoginManager.logOut()
                    }
                    let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                    self.firebaseAuth(credential)
                }
            }
        }
    }
    
    func getFBUserData() {
        if((FBSDKAccessToken.current()) != nil) {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print("SignInVC:getFBUserData: \n \(result!)")
                    print("SignInVC:getFBUserData: \n \(self.dict)")
                }
            })
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("SignInVC:firebaseAuth: ERROR - Authentication with Firebase failed!")
            }
            else {
                print("SignInVC:firebaseAuth: SUCCESS - authenticated with Firebase.")
            }
        })
    }
}

