
import SwiftUI
import UIKit
import SCSDKCreativeKit
import SCSDKLoginKit
import SCSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if SCSDKLoginClient.application(app, open: url, options: options) {
                return true
            }
            return false
        }
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for urlContext in URLContexts {
            let url = urlContext.url
            var options: [UIApplication.OpenURLOptionsKey : Any] = [:]
            options[.openInPlace] = urlContext.options.openInPlace
            options[.sourceApplication] = urlContext.options.sourceApplication
            options[.annotation] = urlContext.options.annotation
            SCSDKLoginClient.application(UIApplication.shared, open: url, options: options)
        }
    }
}
