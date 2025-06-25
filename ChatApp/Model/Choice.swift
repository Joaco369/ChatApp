//
//  Choice.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation

struct Choice: Codable {
  let index: Int
  let message: Message
  let finish_reason: String
}

struct Message: Codable {
  let role: String
  let content: String
}
