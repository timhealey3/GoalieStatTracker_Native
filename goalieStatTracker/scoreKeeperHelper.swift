//
//  scoreKeeperHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation

class scoreKeeperHelper : ObservableObject{
    
    @Published var currentGoals: Int = 0
    @Published var currentShots: Int = 0
    @Published var currentOpponent: String = ""
    @Published var currentWin: Bool = false
    @Published var currentLose: Bool = false
    @Published var currentTie: Bool = false
    @Published var currentOT: Bool = false
    @Published var currentShootout: Bool = false
    
    func resetScoreKeeper() {
        currentGoals = 0
        currentShots = 0
    }
    
    func addGoal() {
        currentGoals += 1
        print("goal!!!")
    }
    
    func subGoal() {
        if ((currentGoals - 1) >= 0) {
            currentGoals -= 1
        }
        print("goal!!!")
    }
    
    func addShot() {
        currentShots += 1;
        print("shot!!")
    }
    
}
