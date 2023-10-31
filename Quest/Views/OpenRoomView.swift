//
//  OpenDoorView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI


struct OpenRoomView: View {
    let playerController = PlayerController.shared
    let gameController = GameController.shared
    
    var roomNum: Int
    var selectedLanguage: Locale
    
    @Environment(\.presentationMode) var pMode
    
    var body: some View {
        VStack {
            Text("enterRoom")
                .font(.callout)
            
            //Treasure room
            if (gameController.rooms[roomNum].isTreasure) {
                VStack {
                    HStack {
                        Image(systemName: "star.circle")
                            .font(.system(size: 50))
                            .padding()
                        Text("Treasure Room")
                            .font(.largeTitle)
                    }
                }
                .background(.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding()
                Text("Collected \(gameController.rooms[roomNum].moneyValue) gold!")
                    .font(.title3)
            }
            //Alien room
            else {
                VStack {
                    Text("Monster Room")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    Text("attacked")
                        .font(.subheadline)
                    Text("\(gameController.rooms[roomNum].damageValue) damage taken")
                        .foregroundColor(.red)
                }
            }
            Spacer()
            
            //Tap to return to previous screen
            Text("tapContinue")
                .onTapGesture() {
                    //Close the room & apply damage or gold
                    gameController.closeRoom(roomNum)
                    if (gameController.rooms[roomNum].isTreasure) {
                        playerController.addGold(gameController.rooms[roomNum].moneyValue)
                    }
                    else {
                        playerController.dealDamage(gameController.rooms[roomNum].damageValue)
                    }
                    self.pMode.wrappedValue.dismiss()
                }
                .foregroundColor(.accentColor)
        }
        .environment(\.locale, selectedLanguage)
    }
}
