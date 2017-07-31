//
//  DataService.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 7/31/17,31.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child(DB_POSTS)
    private var _REF_USERS = DB_BASE.child(DB_USERS)
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uId: String, userData: DICTIONARY_OF_STR_TO_STR) {
        REF_USERS.child(uId).updateChildValues(userData)
    }
    
}
