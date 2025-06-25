//
//  NetworkManager.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation
import SwiftUI

class NetworkManager {
  
  func sendRequest(_ request: URLRequest) async throws -> Data {
    let (responseData, _) = try await URLSession.shared.data(for: request)
    return responseData
  }
}
