//
//  ContentView.swift
//  LocalNotification
//
//  Created by HEMANTH on 01/02/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
    
            Button("Request permission"){
                UNUserNotificationCenter.current().requestAuthorization(
                    options:  [.alert,.badge,.sound]) { success , error in
                        if success {
                            print("ALL set !!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
            }.padding()
                .background(.pink.opacity(0.7))
                .foregroundColor(.white)
            
            Spacer().frame(height: 40)
            
            Button("schedule Notification"){
                let content = UNMutableNotificationContent()
                
                content.title = "Notification title here "
                content.subtitle = "Notification sub title here "
                content.sound = UNNotificationSound.default
                content.launchImageName = "google"
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let request = UNNotificationRequest(
                    identifier:
                        UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }.padding()
                .background(.red)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
