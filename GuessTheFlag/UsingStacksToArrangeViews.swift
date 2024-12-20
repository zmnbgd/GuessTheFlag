//
//  UsingStacksToArrangeViews.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 20.12.24..
//

import SwiftUI

struct UsingStacksToArrangeViews: View {
    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello world")
//            Text("This is another text view")
//        }
//        HStack(spacing: 20) {
//            Text("Hello world")
//            Text("This is another text view")
//        }
        
//        VStack {
//            Spacer()
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//            Spacer()
//        }
        
        ZStack(alignment: .top) {
            Text("Hello world")
            Text("This is another text view")
        }
    }
}

#Preview {
    UsingStacksToArrangeViews()
}
