//
//  Stickersview.swift
//  sad
//
//  Created by Alanoud Saleh on 28/07/1444 AH.
//

import SwiftUI

struct Stickersview: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6){
            Text("Second View")
                .bold()
                .font(.largeTitle)
            
            
            
            HStack{
                Image("sticker4").resizable().frame(width: 80,height: 80)
              
                
                
            
            }
            
            
            
            
            
        }.frame(maxWidth: .infinity,alignment: .center)
        
        
        
}
}

struct Stickersview_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView()
    }
}
