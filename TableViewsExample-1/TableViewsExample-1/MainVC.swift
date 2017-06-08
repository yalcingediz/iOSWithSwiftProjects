//
//  ViewController.swift
//  TableViewsExample-1
//
//  Created by Berkant Y. GEDIZ on 5/20/17,20.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://c1.staticflickr.com/3/2160/2416173897_f5543aa6b5_b.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/L7QBIBkcbT8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Olay")
        
        let p2 = PartyRock(imageURL: "https://wallpaperscraft.com/image/sezen_aksu_girl_teeth_mouth_chest_12524_2048x1152.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/o5Gcgmarvvc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "İhanetten Geri Kalan")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        
        let p4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        
        let p5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")

        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        printPartyRocks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath ) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            print("=============================")
            print("MainVC:tableView:1")
            partyRock.printPartyRock()
            print("MainVC:tableView:2");
            print("=============================")
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("MainVC:tableView: BEGIN")
        let partyRock = partyRocks[indexPath.row]
        print("\t MainVC:tableView: partyRock prints as below: ")
        partyRock.printPartyRock()
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        print("MainVC:tableView: END")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC, let party = sender as? PartyRock {
            destination.partyRock = party
        }
    }
    
    func printPartyRocks() {
        partyRocks.forEach { partyRock in
            partyRock.printPartyRock()
        }
    }
    
}

