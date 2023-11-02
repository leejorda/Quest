//
//  RoomView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import SwiftUI

struct RoomView: View {
    
    var room: Room
    var selectedLanguage: Locale
    
    var body: some View {
        VStack {
            if (!room.isOpen) {
                NavigationLink (destination: OpenRoomView(roomNum: room.roomNumber, selectedLanguage: selectedLanguage).navigationBarBackButtonHidden(true)) {
                    Text("Enter")
                        .frame(width: 100)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.accentColor)
                .cornerRadius(10)
            }
            else {
                if (room.isTreasure) {
                    ZStack {
                        Color.yellow
                    }
                    VStack {
                        Text("Collected \(room.moneyValue) Gold!")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100)
                            .padding()
                    }
                    .background(Color("darkGray"))
                    .cornerRadius(15)
                    .padding()
                }
                else {
                    ZStack {
                        Color.red
                    }
                    VStack {
                        Text("Took \(room.damageValue) damage")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100)
                            .padding()
                    }
                    .background(Color("darkGray"))
                    .cornerRadius(15)
                    .padding()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.98, height: 550)
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1)
                .background(LinearGradient(gradient: Gradient(
                    colors: [.white, .gray, .black]),
                    startPoint: .topLeading,
                    endPoint: .bottom)
                .opacity(room.isOpen ? 0.3 : 0))
        )
        .environment(\.locale, selectedLanguage)
    }
}
