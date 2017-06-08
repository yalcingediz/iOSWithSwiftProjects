//
//  PartyTable.swift
//  TableViewsExample-1
//
//  Created by Berkant Y. GEDIZ on 5/21/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        
        print("PartyCell:updateUI: url= \(url.absoluteString)  \(url.lastPathComponent)")
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                
            } catch  {
                //handle error if needed
                print("updateUI:do-try-catch: \(error.localizedDescription)")
            }
        }
        
    }

}
