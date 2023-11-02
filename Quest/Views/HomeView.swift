//
//  HomeView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import SwiftUI

struct HomeView: View {
    let authController: AuthenticationController = AuthenticationController.shared
    var selectedLanguage: Locale
    @State var isLoggedIn: Bool = true
    
    var body: some View {
        if (!isLoggedIn) {
            SplashView()
                .navigationBarBackButtonHidden(true)
        }
        else {
            VStack {
                Text("Quest")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: GameView(selectedLanguage: selectedLanguage).navigationBarBackButtonHidden(true)) {
                    Text("Play")
                        .frame(minWidth: 300)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                NavigationLink(destination: StatisticsView(selectedLanguage: selectedLanguage).navigationBarBackButtonHidden(true)) {
                    Text("Statistics")
                        .frame(minWidth: 300)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                Button(action: {
                    if (authController.signOut()) {
                        isLoggedIn.toggle()
                    }
                }) {
                    Text("Sign out")
                        .frame(minWidth: 300)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                FirestoreController.shared.getStats()
            }
            .environment(\.locale, selectedLanguage)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedLanguage: Locale(identifier: "en"))
    }
}
