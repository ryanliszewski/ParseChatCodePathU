//
//  MessageTableViewCell.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

  @IBOutlet weak var messageTextLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func bindData(message: Message){
    
    print(message.text)
    messageTextLabel.text = message.text
    
    
  }
}
