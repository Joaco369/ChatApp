//
//  AsyncButton.swift
//  ChatApp
//
//  Created by Joaquin Villarreal on 25/06/2025.
//

import Foundation
import SwiftUI

struct AsyncButton<Label: View>: View {
  
  let label: Label
  let action: () async -> Void
  
  @State private var isRunning = false
  
  init(@ViewBuilder label: () -> Label, action: @escaping () async -> Void) {
    self.action = action
    self.label = label()
  }
  
  var body: some View {
    Button {
      isRunning = true
      Task {
        await action()
        isRunning = false
      }
    } label: {
      label
    }
    .disabled(isRunning)
  }
}
