//
//  Constants.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 6/28/17,26.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

let SHADOW_GRAY:CGFloat = 120.0 / 255.0
let KEY_UID = "uid"
let SEGUE_ID_FROM_SIGN_IN_VC_TO_FEED_VC = "FromSignInVCToFeedVC"
let SEGUE_ID_FROM_FEED_VC_TO_SIGN_IN_VC = "FromFeedVCToSignInVC"
let TABLE_VIEW_CELL_ID = "PostCell"

typealias DICTIONARY_OF_STR_TO_STR        = Dictionary<String, String>
typealias DICTIONARY_OF_STR_TO_ANY_OBJECT = Dictionary<String, AnyObject>

/*
     Firebase related declarations - START
*/
// Database related declaration
let DB_POSTS = "posts"
let DB_USERS = "users"
let DB_ATTRIBUTE_PROVIDER  = "provider"
let DB_ATTRIBUTE_CAPTION   = "caption"
let DB_ATTRIBUTE_LIKES     = "likes"
let DB_ATTRIBUTE_IMAGE_URL = "imageUrl"

// Firebase Storage related declarations
let STORAGE_POST_IMAGES = "post-images"
let POST_IMAGE_SIZE: Int64 = 10 * 1024 * 1024

/*
     Firebase related declarations - END
 */
