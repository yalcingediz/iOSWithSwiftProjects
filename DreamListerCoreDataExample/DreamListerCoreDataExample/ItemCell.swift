//
//  ItemCell.swift
//  DreamListerCoreDataExample
//
//  Created by Berkant Y. GEDIZ on 6/5/17,23.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    func configureCell(item: Item) {
        titleLbl.text = item.title
        priceLbl.text = "\(item.price)"
        detailsLbl.text = item.details
        thumbImg.image = item.toImage?.image as? UIImage
    }

}
