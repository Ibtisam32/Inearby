//
//  BoardView.swift
//  XOGame
//
//  Created by Nsreen Alfaifi on 01/08/1444 AH.
//

import SwiftUI

struct BoardView: View {
    
    
    @ObservedObject var viewModel : GamrViewModel
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    
    


    var body: some View {
        
        
        GeometryReader{ geometry in
            
            ZStack{
                
                Color("XOColor").ignoresSafeArea()
                
                
                VStack(spacing: 50){
                    
                    
                    
                    // board
                    
                    
                    ZStack{
                        
                       
                        XOTimerView()
                        .padding(.top, 40)
                        Rectangle()
                            .foregroundColor(Color("XOBoard"))
                            .frame(width: 317 , height: 341)
                            .cornerRadius(30)
                            .padding(.top, 40)
                        
                        
                        
                        VStack(alignment: .center){
                            LazyVGrid(columns: viewModel.colums  , spacing: 1){
                                
                                ForEach(0..<9){i in
                                    ZStack{
                                        xoRec()
                                        PlayerIndicatorView(systemImageName: viewModel.game.moves[i]?.indicator ?? "applelogo")
                                        
                                    }
                                    .onTapGesture {
                                        viewModel.processPlayerMove(for: i)
                                        
                                    }
                                    
                                }
                            }
                            
                        }
                        .padding(.all , 50)
                            .padding(.top, 40)
                        
                    }
                    
                    
                    /// players
                    
                    ZStack{
                        HStack(spacing: 30){
                            
                            Rectangle()
                                .foregroundColor(Color("isPlay"))
                                .frame(width: 137 , height: 102)
                                .cornerRadius(20)
                            
                            
                            
                            Rectangle()
                                .foregroundColor(Color("isPlay"))
                                .frame(width: 137 , height: 102)
                                .cornerRadius(20)
                            
                            
                        }
                        Image("VS")
                            .resizable()
                            .frame(width: 90 , height: 90)
                        
                    }
                    
                    
                
                    
                    //exit Button
                    Button {
                        mode.wrappedValue.dismiss()
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("Orange"))
                                .frame(width: 300 , height: 50)
                            Text("Exit Game")
                                .foregroundColor(.white)
                                .font(.title)
                            
                            
                        }
                    }
                    
                    
                    
                
                    
                }
                       
                
                
            }
        }
            
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(viewModel: GamrViewModel())
    }
}



struct xoRec: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white).cornerRadius(20)
                .frame(width:84,height: 80)
            
        }
    }
}
