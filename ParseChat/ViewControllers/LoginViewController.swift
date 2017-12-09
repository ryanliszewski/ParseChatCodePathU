//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit
import Parse
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
  

  @IBOutlet weak var usernameTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
  
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var signupButton: UIButton!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func onSignUpButtonTapped(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
    
    self.present(signupViewController, animated: true, completion: nil)
  }
  @IBAction func onLoginButtonTapped(_ sender: Any) {
    
    if let userName = usernameTextField.text {
      if let password = passwordTextField.text {
        PFUser.logInWithUsername(inBackground: userName, password: password, block: { (user, error) in
          if let user = user {
            print(user)
            self.performSegue(withIdentifier: "LoginToHomeSegue", sender: nil)
          } else {
            print("\(error!.localizedDescription)")
          }
        })
      }
    }
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
