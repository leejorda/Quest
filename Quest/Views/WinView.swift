//
//  WinView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI

struct WinView: View {
    
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
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 50))
                        .padding()
                    Text("You won!")
                        .font(.bold(.largeTitle)())
                        .padding()
                }
                .background(.yellow)
                .cornerRadius(10)
                VStack {
                    Text("Remaining HP: \(player.health) / 100")
                    ProgressView(value: Float(player.health)/100)
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
                firestoreController.saveStats(GameState.WON, player.gold)
            }
            .environment(\.locale, selectedLanguage)
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(selectedLanguage: Locale(identifier: "en"))
    }
}
