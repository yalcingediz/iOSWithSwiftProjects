//
//  AppDelegate.swift
//  PushMyNotification
//
//  Created by Berkant Y. GEDIZ on 6/21/17,25.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Messaging.messaging().delegate = self
        Messaging.messaging().shouldEstablishDirectChannel = true
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in})
        
        application.registerForRemoteNotifications()
        
        if application.isRegisteredForRemoteNotifications {
            print("SUCCESS: RegisteredForRemoteNotifications!")
        } else {
            print("FAILURE: Not RegisteredForRemoteNotifications!")
        }
        
        FirebaseApp.configure()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        Messaging.messaging().shouldEstablishDirectChannel = false
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        Messaging.messaging().shouldEstablishDirectChannel = true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //=====================================
    //=====================================
    
    // Start - MessagingDelegate
    public func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        let convName = "AppDelegate:messaging:"
        print("\(convName) Firebase registration token: \(fcmToken)")
    }
    
    // ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        let convName = "AppDelegate:messaging:"
        print("\(convName) Firebase registration token: \(remoteMessage.appData)")
    }
    // End - MessagingDelegate
    
    // Start - UNUserNotificationCenterDelegate
    //   Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        //if let messageID = userInfo[gcmMessageIDKey] {
        //    print("Message ID: \(messageID)")
        //}
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([])
    }
    // End - UNUserNotificationCenterDelegate

    
    func tokenRefreshNotification(notification: NSNotification) {
        let convName = "AppDelegate:tokenRefreshNotification:"
        
        if let refreshedToken = InstanceID.instanceID().token() {
            print("\(convName) refreshed token \(refreshedToken)")
            Messaging.messaging().shouldEstablishDirectChannel = true
        } else {
            print("\(convName) Unable to refresh token")
        }
    }

    
}

