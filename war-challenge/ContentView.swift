//
//  ContentView.swift
//  war-challenge
//
//  Created by Anastasios Rigatos on 15/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpucARD = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var isShowingPopover = false
    
    var body: some View {
        ZStack{
            Image("background").ignoresSafeArea()
            VStack{
                Spacer()
                                Image("king_queen")
                                                    .padding(.all, 20.0)
                                                    .frame(height: nil)
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard).fixedSize(horizontal: true, vertical:true)
                    Spacer()
                    Image(cpucARD)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    //Generate runom number between 2 and 13
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    //Update the cards
                    playerCard = "card" + String(playerRand)
                    cpucARD  =  "card" + String(cpuRand)
                    
                    //Update the score
                    //playerScore += 1
                    //cpuScore += 1
                    
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }else if cpuRand > playerScore {
                        cpuScore += 1
                    }else{
                        self.isShowingPopover = true
                    }
                    
                    
                    
                }, label: {
                    Image("dealbutton")
                }).frame(width: 15.0, height: 15.0).popover(isPresented:$isShowingPopover){
                    Text("Popover content").padding()
                }
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .foregroundColor(Color.white)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .foregroundColor(Color.white)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                    }
                    Spacer()
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
