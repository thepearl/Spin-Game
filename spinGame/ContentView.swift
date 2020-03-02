//
//  ContentView.swift
//  spinGame
//
//  Created by Mohamed Ali BELHADJ on 2/29/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 1, 2]
    @State private var credits = 1000
    private var betAmount = 5
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
                    Image(symbols[numbers[0]])
                    .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.75))
                        .cornerRadius(20)

                    Image(symbols[numbers[1]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(20)

                    Image(symbols[numbers[2]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(20)

                    Spacer()
                }
                Spacer()
                Button(action: {
                    //Random cards values
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //winner winner chiken dinner
                    if self.numbers[0] == self.numbers[1] &&
                        self.numbers[1] == self.numbers[2] {
                        //Won
                        self.credits += self.betAmount * 10
                    }
                    else{
                        self.credits -= self.betAmount
                    }
                }) {
                    Text("Spin")
                        .font(.title)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color(.yellow))
                        .cornerRadius(15)
                }
                
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
