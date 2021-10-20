//
//  ViewController.swift
//  testfile
//
//  Created by Jonathan Nguyen on 10/18/21.
//

import UIKit
import SCSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = SCSDKLoginButton()
        self.view.addSubview(loginButton)
    }


}

