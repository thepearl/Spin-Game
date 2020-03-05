//
//  ContentView.swift
//  spinGame
//
//  Created by Ghazi Tozri on 2/29/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        @State private var symbols = ["apple", "star", "cherry"]
        @State private var numbers = [0, 1, 2]
        @State private var credits = 1000
        @State private var backgrounds = [Color.white, Color.white, Color.white]
        private var betAmount = 100
        @State private var gameOver = false
var body: some View {
        ZStack{
            //Background
            Rectangle()
                .foregroundColor(Color(red: 129/255, green: 236/255, blue: 236/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
            .foregroundColor(Color(red: 85/255, green: 239/255, blue: 196/255))
            .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            //Body
            VStack(){
                
                Spacer()
                
                HStack(){
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 45, height: 45)
                    Text("Spin Game")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 45, height: 45)

                }.scaleEffect(2)
                Spacer()
                
                Text("Credits: " +  String(self.credits))
                    .bold()
                    .padding(.all, 10)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(15)
                Spacer()
                //Pictures
                HStack{
                    
                    //Cards
                    Spacer()
                    cardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    cardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    cardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])


                    Spacer()
                }
                Spacer()
                Button(action: {
                    //Set backgrounds to white
                    self.backgrounds = self.backgrounds.map{ _ in
                        Color.white
                    }
                    //Random cards values
                    self.numbers = self.numbers.map{ _ in
                        Int.random(in: 0...self.symbols.count - 1)
                    }
                    
                    //Check Credit
                    if (self.credits >= 100) {
                            //u got the cash
                                if self.numbers[0] == self.numbers[1] &&
                                    self.numbers[1] == self.numbers[2] {
                                    //winner winner chiken dinner
                                    self.credits += 500
                                    //update backgrounds
                                    self.backgrounds = self.backgrounds.map{ _ in
                                        Color.green  
                                    }
                                }
                                    
                                else{
                                    //Unlcuky
                                    self.credits -= self.betAmount
                                }
                    }
                        //No money :(
                    else{
                        self.gameOver.toggle()
                        }
                }) {
                    Text("Spin")
                        .font(.title)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color(.yellow))
                        .cornerRadius(15)
                }.actionSheet(isPresented: $gameOver, content: {
                    ActionSheet(title: Text("Game Over"), message: Text("Game is over, click relaod to restart again"),
                        buttons:[
                            .default(Text("Reload"), action: {
                                self.credits = 1000
                            }),
                            .default(Text("Exit"), action: {
                                exit(0)
                            })
                    ] )
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
