//
//  Message.swift
//  ParseChat
//
//  Created by Ryan Liszewski on 12/8/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import Foundation
import Parse

class Message: PFObject {
  var text: String? 
}

extension Message: PFSubclassing {
  static func parseClassName() -> String {
    return "Message"
  }
}


