//
//  ContentView.swift
//  Iterable
//
//  Created by Bann Al-Jelawi on 18/07/2021.
//

import SwiftUI
import UIKit
import IterableSDK

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Hello, Iterable!")
                .padding()
            Button("Update User", action: signIn)
            
            Button("Send Custom Event", action: customEvent)
            
            Button("Show Inbox", action: launchMessage)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func launchMessage() {
    
    let messages = IterableAPI.inAppManager.getMessages()
    if messages.isEmpty {
        print("****** No messages to show")

    } else {
        print("****** There is a message to show!")

        //allow messages to display again
        IterableAPI.inAppManager.isAutoDisplayPaused = false
        //Show first message in queue (only message) for this demo
        IterableAPI.inAppManager.show(message: messages[0])
    }
    
}



func signIn(){
    print("i'm signing in!")
    
    // Example data fields
        let dataField : [String: Any] = [
            "firstName": "Bann",
            "isRegisteredUse": "true",
            "SA_User_Test_Key": "completed"
        ]

        // Most important code
        IterableAPI.updateUser(dataField, mergeNestedObjects: false, onSuccess: myUserUpdateSuccessHandler, onFailure: myUserUpdateFailureHandler)
        
}

func myUserUpdateSuccessHandler(data:[AnyHashable:Any]?) -> () {
    // success
    print("sent to Iterable success")
}

func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
    // failure
    print("sent to Iterable failure")
}

func customEvent(){
    
    print("sending custom event to Iterable")
    
    IterableAPI.track(event: "mobileSATestEvent", dataFields: ["platform":"iOS", "isTestEvent":"true", "url":"https://iterable.com/sa-test/Bann", "secret_code_key":"Code_123"])
    
}

//commenting out this code below as I didn't need to create a mobile inbox afterall
/*
//Below was to enable to use of IterableInboxNavigationViewController in SwiftUI
//setup to use IterableInboxNavigationViewController in SwiftUI
     
struct AppInboxViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> IterableInboxNavigationViewController {
        
        let appInbox = IterableInboxNavigationViewController()
        appInbox.navTitle = "Mobile Inbox"
        appInbox.isPopup = false
        
            let messages = IterableAPI.inAppManager.getMessages()
            if messages.isEmpty {
                print("****** No messages to show")
                appInbox.noMessagesTitle = "No Saved Messages"
                appInbox.noMessagesBody = "Check again later!"
            } else {
                print("****** There is a message to show!")


                IterableAPI.inAppManager.isAutoDisplayPaused = false
                // Show an in-app message
                //IterableAPI.inAppManager.show(message: messages[0])

            }
        
            return appInbox
        }
        
        
    func updateUIViewController(_ uiViewController: IterableInboxNavigationViewController, context: Context) {
        
        }
    
}
 */
