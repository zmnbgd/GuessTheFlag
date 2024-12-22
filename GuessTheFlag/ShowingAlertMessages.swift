//
//  ShowingAlertMessages.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 22.12.24..
//

import SwiftUI

struct ShowingAlertMessages: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            
//            Button("Ok") {
//                
//            }
            
            Button("Delete", role: .destructive) {}
            Button("Cancle", role: .cancel) {}
        }
    }
}

#Preview {
    ShowingAlertMessages()
}
