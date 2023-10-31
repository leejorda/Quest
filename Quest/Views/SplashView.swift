//
//  ContentView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import SwiftUI

struct SplashView: View {
    @State private var selectedLanguage = Locale(identifier: "en_CA")
    let languages = [Locale(identifier: "en_CA"), Locale(identifier: "fr_CA")]
    
    var body: some View {
        VStack {
            Text("Quest")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            NavigationLink("Login", destination: LoginView(selectedLanguage: selectedLanguage))
                .foregroundColor(.white)
                .padding()
                .frame(width: 300)
                .background(Color.blue)
                .cornerRadius(4)
            NavigationLink("Register", destination: RegisterView(selectedLanguage: selectedLanguage))
                .foregroundColor(.white)
                .padding()
                .frame(width: 300)
                .background(Color.blue)
                .cornerRadius(4)
            Spacer()
            HStack {
                Spacer()
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { id in
                        Text(id.localizedString(forIdentifier: id.identifier) ?? "")
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .environment(\.locale, selectedLanguage)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
