//
//  RequestBuilder.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation
import SwiftUI

class RequestBuilder {
  
  private var apiKey: String? {
      return Bundle.main.object(forInfoDictionaryKey: "OpenAIAPIKey") as? String
    }
  
  func buildRequest(prompt: String, url: URL?) -> URLRequest? {
    
    guard let apiUrl = url else { return nil }
    
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    
    let parameters: [String: Any] = [
      "model": "gpt-4o-mini",
      "messages": [
          ["role": "user", "content": prompt]
        ]
      ]
    
    guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return nil }
    request.httpBody = jsonData
    return request
  }
}
