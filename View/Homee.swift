//
//  Homee.swift
//  sad
//
//  Created by Alanoud Saleh on 28/07/1444 AH.
//


import SwiftUI

struct Home: View {

    @Namespace var animation
    
    // MARK: Carousel Properties
    @State var Indecscur: Int = 0

    var body: some View {
        VStack(spacing: 15){
            
            viewofHeader()
            
       
            
            (Text("Games")
                .fontWeight(.semibold)
       
            )
            .font(.title2)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.top,15)
            
            
            casutomcards(index: $Indecscur, items: Games, cardPadding: 50, id: \.id) { game,cardSize in
               
             
                    
                    Button {
                        
                    } label: {
                        Image(game.picofgame)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: cardSize.width, height: cardSize.height)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                    }
                    
                }
            
    
            
            
        }
        .padding([.horizontal,.top],15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            GeometryReader{proxy in
                let size = proxy.size
                
                TabView(selection: $Indecscur) {
    ForEach(Games.indices,id: \.self){index in
    Image(Games[index].picofgame)
        .resizable()
        .aspectRatio(contentMode: .fill)
    .frame(width: size.width, height: size.height)
            .clipped()
                    }
                }
               Rectangle()
                    .fill(.ultraThinMaterial)
              

            }
            .ignoresSafeArea()
        }
    }

 
   
                    
   

   

    @State var presentAnotherView = false
    @ViewBuilder
   
    
    func viewofHeader()->some View{
      
        HStack{
            VStack(alignment: .leading, spacing: 6) {
                Text("usernamen2929")
                    .fontWeight(.semibold)
                
                .font(.title2)
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        
            
            
            Button {
                self.presentAnotherView = true
                   } label: {
                       Image("profile")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 70, height: 70)
                         
                           
                   }
           //4
               }
               .sheet(isPresented: $presentAnotherView) {
                   AnotherView()
               }
        }
    }

struct AnotherView : View {
    
    let colors = ["sticker1","sticker2"]
    var body: some View {
        Stickersview()
    }
    
    
    
    
    
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
