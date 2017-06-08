//
//  VideoVC.swift
//  TableViewsExample-1
//
//  Created by Berkant Y. GEDIZ on 5/21/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var videoTitle: UILabel!
 
    
    private var _partyRock:PartyRock!

    var partyRock:PartyRock {
        get {
            return _partyRock
        }
        set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VideoVC:viewDidLoad: BEGIN")

        videoTitle.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        print("VideoVC:viewDidLoad: END")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
