//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 20.12.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            //            Color.blue
            //                .ignoresSafeArea()
//            LinearGradient(colors: [.black, .blue], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .black, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            //.blur(radius: 50)
            
            VStack {
                Text("Guest the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 30) {
                    VStack {
                        Spacer()
                        Text("Tap the flag")
                            //.foregroundColor(.white)
                            //.foregroundStyle(.secondary)
                            .foregroundColor(.secondary)
                        //.font(.title).bold()
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                        //.font(.title).bold()
                            .font(.largeTitle.weight(.semibold))
                    }
                    //MARK: numer in - number come in
                    ForEach(0..<3) { number in
                        Button {
                            //MARK: Flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            //.renderingMode(.original)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                //.background(Color.white.opacity(2))
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                //Spacer()
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("You score is \(scoreTitle)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "You got it!"
        } else {
            scoreTitle = "Wrong!"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}



