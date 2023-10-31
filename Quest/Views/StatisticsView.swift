//
//  StatisticsView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI

struct StatisticsView: View {
    
    let fc: FirestoreController = FirestoreController.shared
    var selectedLanguage: Locale
    
    @Environment(\.presentationMode) var pMode
    
    var body: some View {
        VStack {
            Text("Quest")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            VStack {
                HStack {
                    Text(LocalizedStringKey("highscore"))
                    Text(String(fc.currentUserStats.highscore))
                }
                .font(.headline)
                HStack {
                    Text(LocalizedStringKey("highscore"))
                    Text(String(fc.currentUserStats.totalScore))
                }
                .font(.subheadline)
                .foregroundColor(.yellow)
            }
            .padding()
            VStack {
                HStack {
                    Text(LocalizedStringKey("totalPlayed"))
                    Text(String(fc.currentUserStats.totalGames))
                }
                .font(.headline)
                HStack {
                    Text(LocalizedStringKey("gamesWon"))
                    Text(String(fc.currentUserStats.gamesWon))
                }
                .foregroundColor(.green)
                .font(.subheadline)
                HStack {
                    Text(LocalizedStringKey("gamesLost"))
                    Text(String(fc.currentUserStats.gamesLost))
                }
                .foregroundColor(.red)
                .font(.subheadline)
            }
            Spacer()
            Text("Back")
                .foregroundColor(.accentColor)
                .onTapGesture {
                    self.pMode.wrappedValue.dismiss()
                }
        }
        .environment(\.locale, selectedLanguage)
    }
    
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(selectedLanguage: Locale(identifier: "en"))
    }
}
