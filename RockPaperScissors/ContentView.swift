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
    @State private var rps = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var computerPicker = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:25){
                Text("Rock Paper Scissors")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                ForEach(0..<3){ number in
                    Button(action: {
                        print("Click \(self.rps[number])")
                        self.rpsPicked(playerPicked: self.rps[number])
                        print("Computer picked \(self.computerPicker)")
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
                    self.newRound()
                })
            }
        }
    }
    func rpsPicked(playerPicked pick: String){
        
        showAlert = true
    }
    func newRound (){
        rps.shuffle()
        computerPicker = Int.random(in: 0...2)
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
