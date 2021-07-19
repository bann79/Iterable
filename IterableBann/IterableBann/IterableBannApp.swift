//
//  IterableBannApp.swift
//  Iterable
//
//  Created by Bann Al-Jelawi on 18/07/2021.
//

import SwiftUI
import IterableSDK

@main
struct IterableBannApp: App {
    
    //new way to init on app launch xcode12
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Iterable init here
        let config = IterableConfig()
        IterableAPI.initialize(apiKey: "349dcc9373c74c6699c5d1204a271695", launchOptions: launchOptions, config: config)
        
        IterableAPI.email = "bann79@gmail.com"
        
        //pausing auto display of messages so display occurs on button tap
        IterableAPI.inAppManager.isAutoDisplayPaused = true
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        IterableAppIntegration.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
}
