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
    
    //MARK: Challenge - GuessTheFlag - 1. Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.
    @State private var score = 0
    
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
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("You score is \(score)")
        }
    }
    
//    func flagTapped(_ number: Int) {
//        if number == correctAnswer {
//            scoreTitle = "You got it!"
//            score += 1
//        } else if {
//            scoreTitle = "Wrong! That’s the flag of \(countries[number])."
//            score -= 1
//        } else {
//            score == 8
//            scoreTitle = "You got it! You're a true flag master!"
//        }
//        showingScore = true
//    }
 
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "You got it!"
            score += 1
        }
        //MARK: Challenge - GuessTheFlag - 2. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
        if number != correctAnswer {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])."
            score -= 1
        }
        //MARK: Challenge - GuessTheFlag - 3. Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.
        if score == 8 {
            newGame()
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func newGame() {
        scoreTitle = " Game over! Press Continue to play again"
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}



