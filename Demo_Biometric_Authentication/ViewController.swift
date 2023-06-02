//
//  ViewController.swift
//  Demo_Biometric_Authentication
//
//  Created by Akanksha Pakhale on 12/01/23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printNumber(_ sender: Any) {
        
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "please use the passcode"
        var authorizationError: NSError?
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authorizationError)
        {
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "reason" ){ ( success, evaluteError)
                in
                if success {
                    print(3)
                }
                else{
                    guard evaluteError != nil else {
                        return
                    }
                }
            }        }
    }
    
}

