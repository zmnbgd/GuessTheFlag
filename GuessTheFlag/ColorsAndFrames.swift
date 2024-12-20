//
//  ColorsAndFrames.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 20.12.24..
//

import SwiftUI

struct ColorsAndFrames: View {
    var body: some View {
        //ZStack {
            //            Color.red
            //                .frame(width: 300, height: 300)
            //Color(red: 1.0, green: 0.8, blue: 0.0)
            //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            //Text("Your content")
            //                .background(.red)
       //}
        //        //MARK: Modifier
        //        .background(.red)
        ZStack {
            VStack {
                Color.red
                Color.blue
            }
            Text("My Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    ColorsAndFrames()
}
