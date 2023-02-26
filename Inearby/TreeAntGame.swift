
//
//  Test.swift
//  Ant&Tree
//
//  Created by Kawthar Almajhad on 22/07/1444 AH.
//

import SwiftUI

struct Test: View {
    @State private var text = "Tree"
    @State private var FirstUserScore = 0
    @State var SecondUserScore = 0
    @State private var timerC: Timer?  //nil
    @State private var exitGamePopup = false
    @State private var winPopup = false
    @State private var losePopup = false
   // @State private var drawPopup = false
    
    var body: some View {
        ZStack{LinearGradient(colors: [.init("BabyBlue")], startPoint: .zero, endPoint: .zero).ignoresSafeArea()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.init("DarkBlue"),lineWidth: 6).frame(width: 350,height: 700))

            HStack{
                Text("\(FirstUserScore)").padding(70)
                Text(":")
                Text("\(SecondUserScore)").padding(70)
            }.offset(y:-280).foregroundColor(.white).font(.system(size: 30, weight: .bold))
            
            Button(action: {
                withAnimation(.linear(duration: 0.1)) {
                    self.exitGamePopup = true
                }
                
            }, label: {
                Text("Exit Game")
            }).frame(width: 300, height: 60)
                .background(Color.init("DarkBlue"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.center).offset(y:280)
            
            VStack {
                Spacer().frame(height:160)
                HStack{
                    Button(action: {
                        if self.timerC == nil && text == "Tree" { //If the timer is nil, it means >> no previous press has happened in the current interval
                            self.FirstUserScore += 1
                            self.timerC = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                                self.timerC = nil
                            }
                        }
                        else if FirstUserScore == 2 {
                            self.winPopup = true
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
                                        else if FirstUserScore == 2 {
                                            self.winPopup = true
                                        }
                    }){
                        Image("Ant").resizable()
                            .aspectRatio(contentMode: .fit).frame(width:130 ,height: 180).background(Color.init("Blue")).cornerRadius(15)
                        
                    }.padding()
                }
            }
            
            if $winPopup.wrappedValue {
                WinPopupfunc()
            }
             
                 if $exitGamePopup.wrappedValue {
                     
                     ExitPopupfunc()
                 }
            
               
              
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
    
    private func LosePopupfunc() -> some View {
        
        VStack (spacing : 5) {
            
            Text("You Lose!").font(.system(size: 24, weight: .bold)).foregroundColor(Color.init("DarkBlue")).padding()
        
//                Image("coins").resizable()
//                    .aspectRatio(contentMode: .fit).frame(width:130 ,height: 100)
            
            HStack{
                
                Button(action: {
    
                        self.losePopup = false
       
                }, label: {
                    Text("Back").frame(width: 100, height: 40)
                        .background(Color.init("DarkBlue"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
                
                Button(action: {
                        
                        self.losePopup = false
                    
                }, label: {
                    Text("Play Again").frame(width: 100, height: 40)
                        .background(Color.init("DarkBlue"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
            }
        }.padding()
            .frame(width: 300, height: 270)
            .background(Color.init("PopupColor"))
            .cornerRadius(20)
    }
    
    
    // in my game there is no chance for DRAW , that will be for the XO Game
    
    
//    private func DrawPopupfunc() -> some View {
//
//        VStack (spacing : 5) {
//
//            Text("Draw").font(.system(size: 24, weight: .bold)).foregroundColor(Color.init("DarkBlue")).padding()
//
////                Image("coins").resizable()
////                    .aspectRatio(contentMode: .fit).frame(width:130 ,height: 100)
//
//            HStack{
//
//                Button(action: {
//
//                        self.drawPopup = false
//
//                }, label: {
//                    Text("Back").frame(width: 100, height: 40)
//                        .background(Color.init("DarkBlue"))
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                }).padding()
//
//                Button(action: {
//
//                        self.drawPopup = false
//
//                }, label: {
//                    Text("Play Again").frame(width: 100, height: 40)
//                        .background(Color.init("DarkBlue"))
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                }).padding()
//            }
//        }.padding()
//            .frame(width: 300, height: 270)
//            .background(Color.init("PopupColor"))
//            .cornerRadius(20)
//    }
    
    private func WinPopupfunc() -> some View {
        
        VStack (spacing : 5) {
            
            Text("You Win!").font(.system(size: 24, weight: .bold)).foregroundColor(Color.init("DarkBlue")).padding()
        
                Image("coins").resizable()
                    .aspectRatio(contentMode: .fit).frame(width:130 ,height: 100)
            
            Text("10 Coins").font(.system(size: 16, weight: .bold)).foregroundColor(Color.init("DarkBlue"))
            
            HStack{
                
                Button(action: {
    
                        self.winPopup = false
       
                }, label: {
                    Text("Back").frame(width: 100, height: 40)
                        .background(Color.init("DarkBlue"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
                
                Button(action: {
                        
                        self.winPopup = false
                    
                }, label: {
                    Text("Play Again").frame(width: 100, height: 40)
                        .background(Color.init("DarkBlue"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
            }
        }.padding()
            .frame(width: 300, height: 270)
            .background(Color.init("PopupColor"))
            .cornerRadius(20)
    }
    
    
    private func ExitPopupfunc() -> some View {
        
        VStack (spacing : 5) {
            Text("Exit?").font(.system(size: 24, weight: .bold)).foregroundColor(Color.init("DarkBlue")).padding()
            ZStack {
                RoundedRectangle(cornerRadius: 15).fill(Color.init("BabyGray")).frame(width: 260, height: 120)
                Text("Are you sure you want to quit the game?").font(.headline).foregroundColor(Color.init("DarkBlue")).multilineTextAlignment(.center)
                
            }
            HStack{
                
                Button(action: {
                    
                    withAnimation {
                        
                        self.exitGamePopup = false
                        
                    }
                }, label: {
                    Text("Yes").frame(width: 100, height: 40)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
                
                Button(action: {
                    
                    withAnimation {
                        
                        self.exitGamePopup = false
                        
                    }
                }, label: {
                    Text("No").frame(width: 100, height: 40)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding()
            }
        }
        
        .padding()
        .frame(width: 300, height: 270)
        .background(Color.init("PopupColor"))
        .cornerRadius(20)
        //.shadow(radius: 30)
    
    }
    
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
