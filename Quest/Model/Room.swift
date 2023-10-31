//
//  Room.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation

struct Room: Identifiable, Hashable {
    var id: UUID
    var isTreasure: Bool
    var moneyValue: Int
    var damageValue: Int
    var isOpen: Bool = false
    var roomNumber: Int
    
    init(_ isTreasure: Bool, _ moneyValue: Int, _ damageValue: Int, _ roomNumber: Int) {
        self.id = UUID()
        self.isTreasure = isTreasure;
        self.moneyValue = moneyValue
        self.damageValue = damageValue
        self.roomNumber = roomNumber
    }
}
