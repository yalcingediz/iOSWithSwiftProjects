//
//  MusicListVC.swift
//  SwappingScreensExample-1
//
//  Created by Berkant Y. GEDIZ on 5/14/17,20.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.blue
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func load3rdScreenPressed(_ sender: Any) {
        let songTitle = "Shape Of You"
        /* performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
         **             withIdentifier: UIController class name, sender: any object that you want to pass to that UIController class/object
        */
        print("MusicListVC:load3rdScreenPressed: Before - performSegue(\"PlaySongVC\", \(songTitle))")
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
        print("MusicListVC:load3rdScreenPressed: After = performSegue(\"PlaySongVC\", \(songTitle))" )
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("\t MusicListVC:prepare: Begin")
        if let destination = segue.destination as? PlaySongVC, let song = sender as? String {
            destination.selectedSong = song
            print("\t\t MusicListVC:prepare: Processed - \(segue.identifier!), \(song))")
        }
        print("\t MusicListVC:prepare: End")
        
    }
    

}
