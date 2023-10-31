//
//  ConfirmButtonText.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import SwiftUI

struct ConfirmButtonText: View {
    var text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(4)
            .fontWeight(.bold)
    }
}

struct ConfirmButtonText_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButtonText(text: "Hello")
    }
}
