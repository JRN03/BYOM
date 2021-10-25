//
//  YOLOApp.swift
//  YOLO
//
//  Created by Jonathan Nguyen on 10/14/21.
//

import SwiftUI

@main
struct YOLOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

