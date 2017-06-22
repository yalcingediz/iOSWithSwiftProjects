//
//  ViewController.swift
//  NotificationsExample-1
//
//  Created by Berkant Y. GEDIZ on 6/20/17,25.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. REQUEST PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
            if granted  {
                print("Notification access granted")
            } else {
                print(error?.localizedDescription as Any)
            }
        })

    }
    
    // 3. SCHEDULE NOTIFICATION
    @IBAction func notifyBtnPressed(sender: UIButton) {
        print("Send notification button is pressed")
        
        self.scheduleNotification(inSeconds: 5, completion: { success in
            if success {
                print("Successfully scheduled notification")
            } else {
                print("Error scheduling notificastion!")
            }
        })
 
    }
    
    // 2. CREATE NOTIFICATION
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ success: Bool) -> ()) {
        
        // a) Create attachment
        guard let imageUrl = Bundle.main.url(forResource: "rick_grimes", withExtension: "gif") else {
        //guard let imageUrl = Bundle.main.url(forResource: "photo", withExtension: "JPG") else {
            completion(false)
            return
        }

        var attachment: UNNotificationAttachment
        
        do {
            attachment = try UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
            
        } catch {
            print(error.localizedDescription)
            return
        }
        
        
        let notif = UNMutableNotificationContent()
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        // b) Add attachment
        notif.attachments = [attachment]
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error?.localizedDescription as Any)
                completion(false)
            } else {
                completion(true)
            }
        })
    }
}

