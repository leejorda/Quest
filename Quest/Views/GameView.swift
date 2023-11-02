//
//  GameView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI

struct GameView: View {
    let gameController: GameController = GameController.shared
    var player: Player = Player.shared
    var selectedLanguage: Locale
    
    @State var isRoomOpen: Bool = false
    @State var hp: Int = 0
    @State var gold: Int = 0
    let maxHealth: Float = 100.0
    
    var body: some View {
        //Check game conditions
        switch (gameController.didPlayerWin()) {
        case GameState.WON:
            WinView(selectedLanguage: selectedLanguage)
            
        case GameState.NO_HP, GameState.ALL_DOORS_OPENED:
            LoseView(selectedLanguage: selectedLanguage)
            
        case GameState.CONTINUE:
            VStack {
                Text("Quest")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                HStack {
                    VStack {
                        ProgressView("Player HP", value: Float(hp)/maxHealth)
                            .tint(hp > 60 ? .green : .yellow)
                            .padding()
                        Text("Treasure collected: \(gold)")
                    }
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(gameController.rooms, id: \.id) { r in
                            RoomView(room: r, selectedLanguage: selectedLanguage)
                                .cornerRadius(10)
                        }
                        .padding(5)
                    }
                }
                .onAppear {
                    isRoomOpen = false
                    hp = self.player.health
                    gold = self.player.gold
                }
            }
            .environment(\.locale, selectedLanguage)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(selectedLanguage: Locale(identifier: "en"))
    }
}
