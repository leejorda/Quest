//
//  CancelButtonText.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import SwiftUI

struct CancelButtonText: View {
    var text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(4)
            .fontWeight(.bold)
    }
}

struct CancelButtonText_Previews: PreviewProvider {
    static var previews: some View {
        CancelButtonText(text: "")
    }
}
