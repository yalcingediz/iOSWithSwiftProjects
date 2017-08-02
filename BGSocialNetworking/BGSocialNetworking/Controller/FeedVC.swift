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
import Firebase

class FeedVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var listOfPosts = [Post]()
    var imagePicker = UIImagePickerController()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    @IBOutlet weak var addImage: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        DataService.ds.REF_POSTS.observe(.value, with: { snapshot in
            /*
            if let value = snapshot.value {
                print(value)
            }
             */
            print("FeedVC:viewDidLoad:DataService.ds.REF_POSTS.observe: Children Count = \(snapshot.childrenCount)")
            var cnt = 1
            for childSnap in snapshot.children.allObjects {
                if let snap = childSnap as? DataSnapshot { // childSnap is one object of DB_POSTS aka "posts"
                    if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key] as? AnyObject {
                        print("SNAPval-\(cnt)", snapVal);cnt += 1
                        
                        if let postDict = snapVal as? DICTIONARY_OF_STR_TO_ANY_OBJECT {
                            let key = snap.key
                            let post = Post(postKey: key, postDate: postDict)
                            self.listOfPosts.append(post)
                        }
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    // Implement for UITableViewDataSource: START
    // numberOfSections(in tableView is normally optional and when it not implemented it defaul;t section is 1 anyway
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("FeedVC:tableView numberOfRowsInSection: self.listOfPosts.count = \(self.listOfPosts.count)")
        return self.listOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = listOfPosts[indexPath.row]
        print("FeedVC:tableView cellForRowAt: caption = \(post.caption)")
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL_ID) as? PostCell {
            if let imageUrl = post.imageUrl as? NSString {
                if let img = FeedVC.imageCache.object(forKey: imageUrl) { // in Cache?
                    cell.configureCell(post: post, image: img)
                } else {                                                       // No
                    cell.configureCell(post: post)
                }
                return cell
            }
        } else {
            return PostCell()
        }
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            addImage.image = image
        } else {
            print("ERROR: FeedVC:imagePickerController: No valid image was selected!")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageTapped(_ sender: UITapGestureRecognizer) {
        if let image = addImage.image as? UIImage {
            present(imagePicker, animated: true, completion: nil)
        }
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
