//
//  MessageFeedViewController.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit
import Parse

class MessageFeedViewController: UIViewController {
  
  @IBOutlet weak var messageTextField: UITextField!
  @IBOutlet weak var messageFeedTableView: UITableView!
  
  fileprivate var messages: [Message]! {
    didSet{
      DispatchQueue.main.async {
        self.messageFeedTableView.reloadData()
      }
    }
  }
  
  fileprivate var messageQuery: PFQuery<Message>? = {
    let query: PFQuery<Message>? = PFQuery(className: "Message")
    query?.addAscendingOrder("createdAt")
    return query
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    messageFeedTableView.dataSource = self
    Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
  }
  
  @objc
  private func onTimer() {
    queryMessages()
  }

  private func queryMessages(){
    messageQuery?.findObjectsInBackground(block: { (messages, error) in
      if let messages = messages {
        self.messages = messages
      } else {
        print("\(error?.localizedDescription ?? "No error message available")")
      }
    })
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

//MARK: - UITableViewDataSource
extension MessageFeedViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let messages = messages {
      return messages.count
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
    cell.bindData(message: messages[indexPath.row])
    return cell
  }
}
