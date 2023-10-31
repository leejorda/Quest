//
//  LoseView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI

struct LoseView: View {
    let player: Player = Player.shared
    let gameController: GameController = GameController.shared
    let firestoreController: FirestoreController = FirestoreController.shared
    var selectedLanguage: Locale
    
    @State var roomsOpened = 5
    
    var body: some View {
        if (self.roomsOpened == 0) {
            HomeView(selectedLanguage: selectedLanguage)
        }
        else {
            VStack {
                Spacer()
                VStack {
                    Image(systemName: "xmark.app.fill")
                        .font(.system(size: 50))
                        .padding()
                    Text("Game Over!")
                        .font(.bold(.largeTitle)())
                        .padding()
                }
                .background(.red)
                .cornerRadius(10)
                VStack {
                    Text("Remaining HP: \(player.health) / 100")
                    ProgressView(value: player.health < 0 ? 0.0 : Float(player.health)/100)
                        .frame(maxWidth: 200)
                        .tint(player.health > 60 ? .green : .yellow)
                    Text("Treasure Discovered: \(player.gold)")
                        .font(.subheadline)
                        .padding(10)
                }
                Spacer()
                Text("returnMainMenu")
                    .onTapGesture {
                        gameController.resetGame()
                        self.roomsOpened = gameController.roomsOpened
                    }
                    .foregroundColor(.accentColor)
            }
            .onAppear() {
                firestoreController.saveStats(GameState.NO_HP, player.gold)
            }
            .environment(\.locale, selectedLanguage)
        }
    }
}

struct LoseView_Previews: PreviewProvider {
    static var previews: some View {
        LoseView(selectedLanguage: Locale(identifier: "en"))
    }
}

