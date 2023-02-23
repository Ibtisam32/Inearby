//
//  XOsquareView.swift
//  XOGame
//
//  Created by Nsreen Alfaifi on 01/08/1444 AH.
//

import SwiftUI

struct XORecView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
      
                ZStack{
                    Circle()
                        .foregroundColor(.white).cornerRadius(20)
                        .frame(width: proxy.size.width /   3 - 15 ,
                               height: proxy.size.height / 3 - 15)
                }
       

        
        
        
    }
}


