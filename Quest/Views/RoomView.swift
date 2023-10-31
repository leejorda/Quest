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
                        .frame(minWidth: 100)
                        .padding()
                        .font(.bold(.title)())
                }
                .accentColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
            }
            else {
                if (room.isTreasure) {
                    VStack {
                        Text("Collected \(room.moneyValue) Gold!")
                            .foregroundColor(.white)
                            .frame(minWidth: 100)
                            .padding()
                    }
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .opacity(1)
                }
                else {
                    VStack {
                        Text("Took \(room.damageValue) damage")
                            .foregroundColor(.white)
                            .frame(minWidth: 100)
                            .padding()
                    }
                    .background(Color.red)
                    .cornerRadius(20)
                    .opacity(1)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.98)
        .frame(minHeight: 550)
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1)
                .background(LinearGradient(gradient: Gradient(colors: [.white, .pink, .red, .gray]), startPoint: .topLeading, endPoint: .bottom).opacity(room.isOpen ? 0.3 : 0))
        )
        .environment(\.locale, selectedLanguage)
    }
}
