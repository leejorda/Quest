//
//  LocalizationController.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-18.
//

import Foundation

class LocalizationController: ObservableObject {
    static let shared = LocalizationController()
 
    @Published var language = Locale.current
}
