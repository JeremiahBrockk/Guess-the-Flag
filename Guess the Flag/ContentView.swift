//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Mr. Brock💰🤟🏾 on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    //score =
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
   @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                
            VStack {
                Spacer()
                
            }
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            }
            VStack(spacing: 15) {
                VStack {
                    Text("Tap the Flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                    
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .resizable()
                            .renderingMode(.original)
                            .scaledToFit()
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
            //.frame(maxWidth: .infinity)
            //.padding(.vertical, 20)
            //.background(.regularMaterial)
            //.clipShape(RoundedRectangle//(cornerRadius: 20))
            
           // Spacer()
         //   Spacer()
            
            Text("Score: \(score)")
                .foregroundColor(.white)
                .font(.title.bold())
                .offset(x:0, y:340)
            
            Spacer()
        }
        .padding()
    
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your is score is \(score)")
        }
    }
        
        
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct!"
                score += 1
            } else {
                scoreTitle = "Wrong"
            }
            showingScore = true
        }
            func askQuestion() {
                  countries.shuffle()
                  correctAnswer = Int.random(in: 0...2)
            }
        }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
