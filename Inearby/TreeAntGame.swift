//
//  TreeAntGame.swift
//  Inearby
//
//  Created by Kawthar Almajhad on 23/07/1444 AH.
//

import SwiftUI

struct TreeAntGame: View {
    @State private var text = "Tree"
    @State private var FirstUserScore = 0
    @State var SecondUserScore = 0
    @State private var timerC: Timer?  //nil
    
    var body: some View {
        ZStack{LinearGradient(colors: [.init("BabyBlue")], startPoint: .zero, endPoint: .zero).ignoresSafeArea()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.init("DarkBlue"),lineWidth: 6).frame(width: 350,height: 700))
            
            HStack{
                Text("\(FirstUserScore)").padding(70)
                Text(":")
                Text("\(SecondUserScore)").padding(70)
            }.offset(y:-280).foregroundColor(.white).font(.system(size: 30, weight: .bold))
            
            Button("Exit Game") {
                
            }.frame(width: 300, height: 60)
                .background(Color.init("DarkBlue"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.center).offset(y:280)
            
            
        HStack{
            Button(action: {
                if self.timerC == nil && text == "Tree" { //If the timer is nil, it means >> no previous press has happened in the current interval
                    self.FirstUserScore += 1
                    self.timerC = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                        self.timerC = nil
                    }
                }
            }){
                Image("Tree").resizable()
                    .aspectRatio(contentMode: .fill).frame(width:130 ,height: 180).background(Color.init("DarkBlue")).cornerRadius(15)
            }.padding()
            
            Button(action: {
                if self.timerC == nil && text == "Ant" { //If the timer is nil, it means >> no previous press has happened in the current interval
                    self.FirstUserScore += 1
                    self.timerC = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                        self.timerC = nil
                    }
                }
            }){
                Image("Ant").resizable()
                    .aspectRatio(contentMode: .fit).frame(width:130 ,height: 180).background(Color.init("Blue")).cornerRadius(15)
                
            }.padding()
        }.offset(y:100)
            
          
                Text(text)
                    .frame(width: 150, height: 60)
                    .background(Color.init("DarkBlue"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 30, weight: .bold))
                    .offset(y:-170)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            self.text =   self.text == "Tree" ? "Ant" : "Tree"
                        }// self.text = bool? true : false
                    }
            
        }
    }
    
}

struct TreeAntGame_Previews: PreviewProvider {
    static var previews: some View {
        TreeAntGame()
    }
}
