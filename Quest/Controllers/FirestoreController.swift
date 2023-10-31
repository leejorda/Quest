//
//  FirestoreController.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-16.
//

import Foundation
import Firebase

class FirestoreController: ObservableObject {
    static let shared = FirestoreController()
    let db = Firestore.firestore()
    @Published var currentUserStats: FirestoreStats = FirestoreStats(0,0,0,0,0)
    
    func saveStats(_ gameState: GameState, _ score: Int) {
        getStats()
        
        //Retrieve stats by user id
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let userStats = db.collection("Stats").document(uid)
            
            //Set new statistics
            currentUserStats.totalGames += 1
            currentUserStats.totalScore += score
            
            if (gameState == GameState.WON) {
                currentUserStats.gamesWon += 1
                if (score > currentUserStats.highscore) {
                    currentUserStats.highscore = score
                }
            }
            else if (gameState == GameState.NO_HP || gameState == GameState.ALL_DOORS_OPENED) {
                currentUserStats.gamesLost += 1
            }
            
            //Store data to firestore
            userStats.setData([
                "highscore": currentUserStats.highscore,
                "gamesWon": currentUserStats.gamesWon,
                "gamesLost": currentUserStats.gamesLost,
                "totalScore": currentUserStats.totalScore,
                "totalGames": currentUserStats.totalGames
            ]) { error in
                if let error = error {
                    print(#function, "Unable to store in firestore: \(error)")
                }
                else {
                    print(#function, "Successfully stored data")
                }
            }
        }
    }
    
    func getStats() {
        //Retrieve stats by user id
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let userStats = db.collection("Stats").document(uid)
            
            userStats.getDocument { (document, error) in
                //Retrieve data & convert it into an object
                if let document = document, document.exists {
                    let stats = document.data()
                    let firestoreStats = FirestoreStats(
                        stats?["highscore"] as? Int ?? 0,
                        stats?["gamesWon"] as? Int ?? 0,
                        stats?["gamesLost"] as? Int ?? 0,
                        stats?["totalScore"] as? Int ?? 0,
                        stats?["totalGames"] as? Int ?? 0
                    )
                    self.currentUserStats = firestoreStats
                    print(#function, "Retrieved user stats")
                }
                else {
                    self.currentUserStats = FirestoreStats(0,0,0,0,0)
                    print(#function, "No document found")
                }
            }
        }
    }
}
