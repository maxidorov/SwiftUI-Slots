//
//  ContentView.swift
//  Slots
//
//  Created by Maxim Sidorov on 02.07.2020.
//  Copyright © 2020 Maxim Sidorov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2, 0]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200 / 255, green: 143 / 255, blue: 32 / 255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228 / 255, green: 195 / 255, blue: 76 / 255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                // Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Credits: \(credits)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Slots
                HStack {
                    Spacer()
                    
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button(action: {
                    
                    // Change the images
                    self.numbers[0] = Int.random(in: 0..<self.symbols.count)
                    self.numbers[1] = Int.random(in: 0..<self.symbols.count)
                    self.numbers[2] = Int.random(in: 0..<self.symbols.count)
                    
                    // Check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
                        // Won
                        self.credits += self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding(.horizontal, 30)
                        .background(Color.pink)
                        .cornerRadius(20 )
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
