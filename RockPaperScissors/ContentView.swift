//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kevin Dicke on 10/23/19.
//  Copyright © 2019 Spritztour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var rps = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin = Bool.random()
    @State private var computerPicker = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:20){
                Text("Rock Paper Scissors")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                VStack(spacing:5){
                    FontStyle(text:"Computer picked \(rps[computerPicker])")
                        .padding(1)
                    FontStyle(text:"You should \(shouldWin ? "Win" : "Lose")")
                        .padding(1)
                }
                ForEach(0..<3){ number in
                    Button(action: {
                        self.checkRound(thePlayPicked: self.rps[number])
                    }){
                        VStack(spacing:0){
                            ImageStyle(image: self.rps[number])
                            FontStyle(text: self.rps[number])
                        }
                    }
                }
                FontStyle(text: "Your score: \(score)")
                        
                FontStyle(text: "Round \(round) of 10")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(scoreTitle), message: Text("Your score: \(score)"), dismissButton: .default(Text("Ok")){
                    self.round < 10 ? self.newRound() : self.newGame()
                })
            }
        }
    }
    func checkRound(thePlayPicked pick: String){
        let draw = "Draw!!!!"
        let win = "You win this round!"
        let lose = "Nope! Better luck next time.."
        print(pick)
        print(shouldWin)
        print(rps[computerPicker])
        
        if pick == rps[computerPicker] {
            scoreTitle = draw
            showAlert = true
        }
        else if rps[computerPicker] == "Rock" && shouldWin {
            if pick == "Paper" {
                scoreTitle = win
                score += 1
                showAlert = true
            }
            else {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
        }
        else if rps[computerPicker] == "Rock" && shouldWin == false {
            if pick == "Paper" {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
            else {
                scoreTitle = win
                score += 1
                showAlert = true
            }
        }
        else if rps[computerPicker] == "Paper" && shouldWin {
            if pick == "Scissors" {
                scoreTitle = win
                score += 1
                showAlert = true
            }
            else {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
        }
        else if rps[computerPicker] == "Paper" && shouldWin == false {
            if pick == "Scissors" {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
            else {
                scoreTitle = win
                score += 1
                showAlert = true
            }
        }
        else if rps[computerPicker] == "Scissors" && shouldWin {
            if pick == "Rock" {
                scoreTitle = win
                score += 1
                showAlert = true
            }
            else {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
        }
        else if rps[computerPicker] == "Scissors" && shouldWin == false {
            if pick == "Rock" {
                scoreTitle = lose
                score -= 1
                showAlert = true
            }
            else {
                scoreTitle = win
                score += 1
                showAlert = true
            }
        }
        
    }
    func newRound (){
        computerPicker = Int.random(in: 0...2)
        shouldWin = Bool.random()
        round += 1
    }
    func newGame(){
        newRound()
        score = 0
        round = 1
    }
}


struct FontStyle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
    }
}

struct ImageStyle: View {
    var image: String
    
    var body: some View {
        Image(image)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
