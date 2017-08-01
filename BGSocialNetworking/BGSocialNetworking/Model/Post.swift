//
//  Post.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 8/1/17,31.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
    }
    
    init(postKey: String, postDate: DICTIONARY_OF_STR_TO_ANY_OBJECT) {
        self._postKey = postKey
        
        if let caption = postDate[DB_ATTRIBUTE_CAPTION] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postDate[DB_ATTRIBUTE_IMAGE_URL] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postDate[DB_ATTRIBUTE_LIKES] as? Int {
            self._likes = likes
        }
    }
}
