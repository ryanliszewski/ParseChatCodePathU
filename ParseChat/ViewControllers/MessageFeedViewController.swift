//
//  MessageFeedViewController.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class MessageFeedViewController: UIViewController {

  
  @IBOutlet weak var messageTextField: UITextField!
  @IBOutlet weak var messageTableView: UITableView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }

  @IBAction func onSendMessageButtonTapped(_ sender: Any) {
    
    var message = Message()
    message.text = messageTextField.text
    
    message.saveInBackground { (success, error) in
      if success {
        print("message was saved")
        //TODO
          //Make delegate to display message
      } else {
        print("\(error?.localizedDescription ?? "No error message")")
        //TODO
          //Make drop down notification for message sent and no message = error 
      }
    }
  }
}





extension MessageFeedViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
