//
//  CircleView.swift
//  BGSocialNetworking
//
//  Created by Berkant Y. GEDIZ on 7/8/17,27.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
}
