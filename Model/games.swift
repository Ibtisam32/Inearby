//
//  games.swift
//  sad
//
//  Created by Alanoud Saleh on 28/07/1444 AH.
//

import Foundation
import SwiftUI

// MARK: Movie Model & Sample Movies
struct game: Identifiable,Equatable{
    var id = UUID().uuidString
    var gametitle: String
    var picofgame: String
}

var Games: [game] = [
   game(gametitle: "tic-tac-toe", picofgame: "game1"),
    game(gametitle: "ant&tree", picofgame: "game2")

]
