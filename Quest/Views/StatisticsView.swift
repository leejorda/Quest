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
            Spacer()
            HStack {
                Spacer()
                
                VStack {
                    Text(String(fc.currentUserStats.highscore))
                        .font(.system(size: 36))
                    Text(LocalizedStringKey("highscore"))
                }
                .frame(width: 125)
                .padding()
                .background(Color("darkGray"))
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Spacer()
                
                VStack {
                    Text(String(fc.currentUserStats.totalScore))
                        .font(.system(size: 36))
                    Text(LocalizedStringKey("totalScore"))
                }
                .frame(width: 125)
                .padding()
                .background(Color("darkGray"))
                .cornerRadius(20)
                .foregroundColor(.yellow)
                
                Spacer()
            }
            .padding()
            
            HStack {
                Spacer()
                VStack (alignment: .center){
                    Text(String(fc.currentUserStats.gamesWon))
                        .font(.system(size: 36))
                    Text(LocalizedStringKey("gamesWon"))
                }
                .frame(width: 125)
                .foregroundColor(.green)
                .padding()
                .background(Color("darkGray"))
                .cornerRadius(20)
                
                Spacer()
                
                VStack (alignment: .center){
                    Text(String(fc.currentUserStats.gamesLost))
                        .font(.system(size: 36))
                    Text(LocalizedStringKey("gamesLost"))
                }
                .frame(width: 125)
                .padding()
                .background(Color("darkGray"))
                .cornerRadius(20)
                .foregroundColor(.red)
                
                Spacer()
            }
            
            HStack {
                VStack (alignment: .center) {
                    Text(String(fc.currentUserStats.totalGames))
                        .font(.system(size: 36))
                    Text(LocalizedStringKey("totalPlayed"))
                        .font(.system(size: 20))
                }
                .padding()
                .background(Color("darkGray"))
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            .padding()
            .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Back")
                .foregroundColor(.accentColor)
                .onTapGesture {
                    self.pMode.wrappedValue.dismiss()
                }
        }
        .fontWeight(.bold)
        .environment(\.locale, selectedLanguage)
    }
    
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(selectedLanguage: Locale(identifier: "en"))
    }
}
