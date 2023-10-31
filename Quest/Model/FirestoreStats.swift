//
//  FirestoreStats.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation

class FirestoreStats {
    var highscore: Int
    var gamesWon: Int
    var gamesLost: Int
    var totalScore: Int
    var totalGames: Int
    
    init(_ highscore: Int, _ gamesWon: Int, _ gamesLost: Int, _ totalScore: Int, _ totalGames: Int) {
        self.highscore = highscore
        self.gamesWon = gamesWon
        self.gamesLost = gamesLost
        self.totalScore = totalScore
        self.totalGames = totalGames
    }
}

