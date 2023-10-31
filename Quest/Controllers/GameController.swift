//
//  GameController.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation

class GameController: ObservableObject {
    static let shared = GameController()
    
    @Published var rooms: [Room] = []
    let player: Player = Player.shared
    let playerHelper: PlayerController = PlayerController.shared
    var roomsOpened: Int = 0
    
    var maxRooms = 6
    
    //Constructor
    init() {
        for i in 0...maxRooms-1 {
            let r = Room(isTreasure(), generateMoney(), generateDamage(), i)
            self.rooms.append(r)
        }
    }
    
    //Generates rooms with random values
    func generateRooms() {
        for i in 0...maxRooms-1 {
            let r = Room(isTreasure(), generateMoney(), generateDamage(), i)
            self.rooms.append(r)
        }
    }
    
    //Determines if a room has treasure
    func isTreasure() -> Bool {
        return Int.random(in: 0...1) == 1 ? true : false;
    }
    
    //Generates money
    func generateMoney() -> Int {
        return Int.random(in: 50...500)
    }
    
    //Generates damage
    func generateDamage() -> Int {
        return Int.random(in: 20...30)
    }
    
    //Closes a room
    func closeRoom(_ roomNum: Int) {
        self.roomsOpened += 1
        self.rooms[roomNum].isOpen = true
    }
    
    //Checks win condition
    func didPlayerWin() -> GameState {
        if (self.roomsOpened == self.maxRooms && self.player.health > 0) {
            return GameState.WON
        }
        else if (self.player.health <= 0) {
            return GameState.NO_HP
        }
        else if (self.roomsOpened == self.maxRooms) {
            return GameState.ALL_DOORS_OPENED
        }
        return GameState.CONTINUE
    }
    
    //Resets the game
    func resetGame() {
        self.playerHelper.resetPlayer()
        self.rooms.removeAll()
        self.roomsOpened = 0
        self.generateRooms()
    }
}
