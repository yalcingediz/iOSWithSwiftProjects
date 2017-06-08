//
//  PartyRock.swift
//  TableViewsExample-1
//
//  Created by Berkant Y. GEDIZ on 5/21/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation

class PartyRock {
    private var _imageURL:String!
    private var _videoURL:String!
    private var _videoTitle:String!
    
    var imageURL:String {
        return _imageURL
    }
    
    var videoURL:String {
        return _videoURL
    }
    
    var videoTitle:String {
        return _videoTitle
    }
    
    init(imageURL:String, videoURL:String, videoTitle:String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
    func printPartyRock() {
        print("imageURL: \(_imageURL) videoURL: \(_videoURL) videoTitle: \(_videoTitle)")
    }
    
}
