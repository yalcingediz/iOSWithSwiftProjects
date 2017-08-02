//
//  PostCell.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 7/24/17,30.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import FirebaseStorage

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post, image: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        
        if image != nil {
            self.postImg.image = image
        } else {
            let ref = Storage.storage().reference(forURL: post.imageUrl)
            ref.getData(maxSize: POST_IMAGE_SIZE, completion: { (data, error) in
                if error != nil {
                    print("ERROR: PostCell:configureCell - Unable to download image from Firebase storage")
                } else {
                    print("SUCCESS: PostCell:configureCell - Image downladed: \(post.imageUrl)")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImg.image = img
                            if let imageUrl = post.imageUrl as? NSString {
                                FeedVC.imageCache.setObject(img, forKey: imageUrl)
                            }
                                
                        }
                    }
                }
            })
        }
    }

}
