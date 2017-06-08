//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Berkant Y. GEDIZ on 5/11/17,19.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    let NUMBER_OF_IMAGES = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWith: CGFloat = 0.0
        let SCROLL_VIEW_WIDTH: CGFloat = scrollView.frame.size.width
        let SCROLL_VIEW_HEIGHT: CGFloat = scrollView.frame.size.height
        
        print("Scrollview width: \(scrollView.frame.size.width)")
        
        for i in 0..<3 {
            let image = UIImage(named: "icon\(i).png")
            images.append(UIImageView(image: image))
            
            let newX : CGFloat =  SCROLL_VIEW_WIDTH / 2 + SCROLL_VIEW_WIDTH * CGFloat(i)
            contentWith += newX
            
            // add UIImageView
            scrollView.addSubview(images[i])
            images[i].frame = CGRect(x: newX - 75, y: (SCROLL_VIEW_HEIGHT / 2) - 75, width: 150, height: 150)
            
            print("Image-\(i): \(String(describing: image?.description))")
            
        }
        print ("Count: \(images.count)")
        
        scrollView.clipsToBounds = false
        scrollView.contentSize  = CGSize(width: contentWith, height: view.frame.size.height)
        
    }
}

