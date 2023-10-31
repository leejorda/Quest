//
//  AuthenticationController.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import Foundation
import Firebase

class AuthenticationController {
    static let shared = AuthenticationController()
    private let auth = Auth.auth()
    private var errorMessage = ""
    
    func registerUser(_ email: String, _ password: String, completion: @escaping (Bool) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                completion(true)
            } else {
                self.errorMessage = error!.localizedDescription
                completion(false)
            }
        }
    }
    
    func loginUser(_ email: String, _ password: String, completion: @escaping (Bool) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if (error == nil) {
                completion(true)
            }
            else {
                self.errorMessage = error!.localizedDescription
                completion(false)
            }
        }
    }
    
    func signOut() -> Bool {
        do {
            try auth.signOut()
            return true
        }
        catch let error as NSError {
            print(#function, "Error signing out: \(error)")
            return false
        }
    }
    
    func getErrorMessage() -> String {
        return self.errorMessage
    }
    
}
