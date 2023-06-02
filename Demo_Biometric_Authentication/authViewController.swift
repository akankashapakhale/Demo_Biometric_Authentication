//
//  authViewController.swift
//  Demo_Biometric_Authentication
//
//  Created by Akanksha Pakhale on 12/01/23.
//

import UIKit
import LocalAuthentication

class authViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func tapBtn(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "reason") {
                [weak self] success, error in
                guard success, error == nil else {
                    let alert = UIAlertController(title: "failed", message: "please try again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                    style: .cancel, handler: nil ))
                    self?.present(alert, animated: true)
                    return
                }
              
            }
        }

        else {
           //cannot use face
            let alert = UIAlertController(title: "unavailable", message: "cannot use this featur", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                            style: .cancel, handler: nil) )
            present(alert, animated: true)
        }
        
    }
    
}
