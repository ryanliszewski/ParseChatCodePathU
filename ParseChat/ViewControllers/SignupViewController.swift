//
//  SignupViewController.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {


  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @IBAction func onBackButtonTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func onSignupButtonTapped(_ sender: Any) {
    let newUser = PFUser()
    
    if let username = usernameTextField.text {
      if let password = passwordTextField.text {
        if let email = emailTextField.text {
          newUser.username = username
          newUser.password = password
          newUser.email = email
          
          newUser.signUpInBackground(block: { (success, error ) in
            if success {
              self.performSegue(withIdentifier: "SignupToHomeSegue", sender: nil)
            } else {
              print("\(error!.localizedDescription)")
            }
          })
        }
      }
    }
  }
}
