import SwiftUI
import UIKit
import SCSDKCreativeKit
import SCSDKLoginKit
import SCSDKCoreKit

struct LoginCVWrapper: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        return LoginViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //Unused in demonstration
    }
    
    
}
