//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 20.12.24..
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
//            Color.blue
//                .ignoresSafeArea()
            LinearGradient(colors: [.black, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag")
                        .foregroundColor(.white)
                        .font(.title).bold()
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.title).bold()
                }
                //MARK: numer in - number come in
                ForEach(0..<3) { number in
                    Button {
                        //MARK: Flag was tapped
                        
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
