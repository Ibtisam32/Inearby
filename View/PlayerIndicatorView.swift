//
//  PlayerIndicatorView.swift
//  Ttictactoe
//
//  Created by Nsreen Alfaifi on 16/07/1444 AH.
//

import SwiftUI

struct PlayerIndicatorView: View {

    var systemImageName: String

    var body: some View {
        
        Image(systemImageName)
            .resizable()
            .frame(width: 100 , height: 100)
            .foregroundColor(.orange)
            .opacity(systemImageName == "applelogo" ? 0 : 1)
        
        
    }
}

struct PlayerIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerIndicatorView(systemImageName: "applelogo")
    }
}
