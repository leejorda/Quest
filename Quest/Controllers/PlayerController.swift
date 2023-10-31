//
//  PlayerController.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation

class PlayerController: ObservableObject {
    static let shared = PlayerController()
    let player: Player = Player.shared
    
    func dealDamage(_ damage: Int) {
        player.health -= damage
    }
    
    func addGold(_ amount: Int) {
        player.gold += amount
    }
    
    func resetPlayer() {
        player.gold = 0
        player.health = 100
    }
}
