//
//  SignInButton.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 6/28/17,26.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class SignInButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 5.0
    }
  

}
