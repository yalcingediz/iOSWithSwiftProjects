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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var FacebookLoginButton: SocialSignInButton!
    @IBOutlet weak var emailTextField: EmailAndPasswordTextFields!
    @IBOutlet weak var passwordTextField: EmailAndPasswordTextFields!
    
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("SignInVC:viewDidAppear: ID Found in Keychain")
            performSegue(withIdentifier: SEGUE_ID_FROM_SIGN_IN_VC_TO_FEED_VC, sender: nil)
        }
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
                if let user = user {
                    self.completeSignIn(id: user.uid, providerId: credential.provider)
                }
            }
        })
    }
    
    @IBAction func signInButtonPressed(_ sender: SignInButton) {
        let firebaseAuth = Auth.auth()
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            firebaseAuth.signIn(withEmail: email, password: pwd, completion: {(user, error) in
                if error == nil {
                    print("SUCCESS - user, \(email), authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid, providerId: user.providerID)
                    }
                } else {
                    print("\(error!.localizedDescription)...So, will try to sign in user: \(email)")
                    firebaseAuth.createUser(withEmail: email, password: pwd, completion: {(user, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            print("FAILURE - Unable to create and authenticate with Firebase using emai: \(email)")
                        } else {
                            print("SUCCESS - user, \(email), created and authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(id: user.uid, providerId: user.providerID)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String, providerId: String ) {
        if KeychainWrapper.standard.set(id, forKey: KEY_UID) != true {
            print("FAILURE - Could not save id to Keychain")
        }
        
        // Firebase user creationwitih his/her provider info, if needed
        let userData: DICTIONARY_OF_STR_TO_STR = [DB_ATTRIBUTE_PROVIDER: providerId]
        DataService.ds.createFirebaseDBUser(uId: id, userData: userData)
        
        performSegue(withIdentifier: SEGUE_ID_FROM_SIGN_IN_VC_TO_FEED_VC, sender: nil)
    }
}

