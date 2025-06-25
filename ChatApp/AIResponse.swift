//
//  AIResponse.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation

struct AIResponse: Codable {
  let id: String
  let object: String
  let created: Int
  let model: String
  let choices: [Choice]
}
