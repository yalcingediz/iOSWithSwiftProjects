//
//  RoundedImage.swift
//  MVC-Test
//
//  Created by Berkant Y. GEDIZ on 5/23/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
