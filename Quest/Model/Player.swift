//
//  Player.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation

class Player: ObservableObject {
    static let shared = Player();
    
    @Published var health = 100
    @Published var gold = 0;
}
