//
//  LoginViewController.swift
//  FoodTracker
//
//  Created by Jiuheng Ji on 2019/1/30.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginPressed(_ sender: Any) {
        // Get the default auth UI element
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            // log the error
            return
        }
        
        // Set ourselves as the delegate
        authUI?.delegate = self
        
        // Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        // Show it
        present(authViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult:
        AuthDataResult?, error: Error?) {
        // Check if there was an error
        if error != nil {
            // Log the error
            return
        }
        
        // authDataResult?.user.uid
        
        performSegue(withIdentifier: "loginSuccess", sender: self)
    }
}
