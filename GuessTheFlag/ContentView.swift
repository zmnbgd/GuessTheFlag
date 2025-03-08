//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 20.12.24..
//

import SwiftUI

//MARK: Custom Modifier
struct fontModifier: ViewModifier {
    
    var text: String
    
    func body(content: Content) -> some View {
        
        Text(text)
            .font(.largeTitle).bold()
            .clipShape(.capsule)
            .foregroundColor(.yellow)
            .padding(5)
    }
}

//MARK: Custom Modifier Extension
extension View {
    func appTextModifier(text: String) -> some View {
        modifier(fontModifier(text: text))
    }
}

//MARK: Custom Modifier
struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(radius: 10)
            .padding(5)
    }
}



struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var rotationAnimationAmount = [0.0, 0.0, 0.0]
    
    @State private var flagButtonOpacity = [1.0, 1.0, 1.0]
    
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
                //MARK: Challenge - Project 3. - 3. Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
                //Text("Guest the flag")
                appTextModifier(text: "Guest the flag")
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
                            //MARK: - Challenge - Project 6. - 1. When you tap a flag, make it spin around 360 degrees on the Y axis.
                            withAnimation(.spring(duration: 1.0, bounce: 0.5)) {
                                rotationAnimationAmount[number] += 360
                            }
                            
                        } label: {
                            //MARK: Challenge - Project 3. - 2. Go back to project 2 and replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.
                            //Image(countries[number])
                            FlagImage(imageName: countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .rotation3DEffect(.degrees(rotationAnimationAmount[number]), axis: (x: 0.0, y: 1.0, z: 0.0))
                            //.renderingMode(.original)
                                .opacity(flagButtonOpacity[number])
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
            Text("Your score is \(score)")
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
 
    //MARK: - Challenge - Project 6. - 2. Make the other two buttons fade out to 25% opacity. 
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "You got it!"
            score += 1
            
            withAnimation(.easeInOut(duration: 0.5)) {
                for flag in 0..<3 {
                    if flag != correctAnswer {
                        flagButtonOpacity[flag] = 0.25
                    }
                }
            }
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
        flagButtonOpacity = [1.0, 1.0, 1.0]
    }

    func newGame() {
        scoreTitle = "You win! Press Continue to play again"
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}



