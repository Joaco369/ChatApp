//
//  ChatView.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import SwiftUI

struct ChatView: View {
  
  @State private var inputText = ""
  @State private var isLoading = false
  @State private var responseText = ""
  
  let aiService = AIService()
  
    var body: some View {
      VStack {
        Spacer()
        TextField("Ask anything...", text: $inputText)
          .autocorrectionDisabled(true)
          .padding()
          .border(Color.gray)
        
        AsyncButton {
          Text("Ask AI")
            .padding()
            .background(isLoading ? Color.gray : Color.blue)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 8))
        } action: {
          isLoading = true
          responseText = await aiService.getAiResponse(prompt: inputText)
          isLoading = false
        }
        VStack {
          ProgressView()
            .opacity(isLoading ? 1 : 0)
          ScrollView {
            Text(responseText)
              .opacity(isLoading ? 0.5 : 1)
          }
        }
      }
    }
}

#Preview {
    ChatView()
}
