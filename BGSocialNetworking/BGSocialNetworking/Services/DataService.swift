//
//  DataService.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 7/31/17,31.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

class DataService {
    static let ds = DataService()
    // References for Database
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child(DB_POSTS)
    private var _REF_USERS = DB_BASE.child(DB_USERS)
    
    // References for Storage
    private var _REF_STORAGE_POST_IMAGES = STORAGE_BASE.child(STORAGE_POST_IMAGES)
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_STORAGE_POST_IMAGES: StorageReference {
        return _REF_STORAGE_POST_IMAGES
    }
    
    func createFirebaseDBUser(uId: String, userData: DICTIONARY_OF_STR_TO_STR) {
        REF_USERS.child(uId).updateChildValues(userData)
    }
    
    
    
}
