//
//  MessageFeedViewController.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class MessageFeedViewController: UIViewController {

  
  @IBOutlet weak var messageTableView: UITableView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
