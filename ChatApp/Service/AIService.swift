//
//  AIService.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation

class AIService {
  
  private let requestBuilder = RequestBuilder()
  private let networkManager = NetworkManager()
  private let errorMessage: String = "Error: Unable to generate AI Response"
  
  private let url = URL(string: "https://api.openai.com/v1/chat/completions")
  
  func getAiResponse(prompt: String) async -> String {
    guard let request = requestBuilder.buildRequest(prompt: prompt, url: url) else {
      print("Error. Failed to request API")
      return errorMessage
    }
    
    do {
      let data = try await networkManager.sendRequest(request)
      return decodeResponse(data)
    } catch {
      print("Error")
      return errorMessage
    }
  }
  
  private func decodeResponse(_ data: Data) -> String {
    print("=== Raw Response ===")
    print(String(data: data, encoding: .utf8) ?? "No string")
    do {
      let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
      return aiResponse.choices.first?.message.content ?? "No response found"
    } catch {
      print("Error decoding: \(error)")
      return errorMessage
    }
  }
}
