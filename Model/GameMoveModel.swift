//
//  Model.swift
//  Ttictactoe
//
//  Created by Nsreen Alfaifi on 17/07/1444 AH.
//

import Foundation
import SwiftUI


struct move : Codable{
     
    let isPlayer1 : Bool
    let boardIndex : Int
    
    
    var indicator : String {
        return isPlayer1 ? "X" : "O"
    }
}


struct Game : Codable {
    
    let id: String
    var Player1Id : String
    var Player2Id : String
    
    var blockMoveForPlayerId: String
    var winningPlayerId: String
    var rematchPlayerId: [String] // must both two player want rematch
    
    var moves: [move?]
    
    
    
}
