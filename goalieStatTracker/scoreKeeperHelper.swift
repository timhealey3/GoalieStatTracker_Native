//
//  scoreKeeperHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation
import SwiftData

class scoreKeeperHelper : ObservableObject{

    @Published var currentGoals: Int = 0
    @Published var currentShots: Int = 0
    @Published var currentOpponent: String = ""
    @Published var currentWin: Bool = false
    @Published var currentLose: Bool = false
    @Published var currentTie: Bool = false
    @Published var currentOT: Bool = false
    @Published var currentShootout: Bool = false
    @Published var currentNotes: String = ""
    @Published var shotType: [String] = ["Slapshot", "Wristshot", "Breakaway", "Rebound"]
    @Published var currentShotType: [String] = []
    @Published var currentGoalCords: [[Float]] = []
    @Published var currentShotCords: [[Float]] = []
    var currentOpponentID: Int = 0
    
    func fetchOpponentID(from context: ModelContext) -> [Team] {
        let fetchDescriptor = FetchDescriptor<Team>(
            predicate: #Predicate { $0.teamName == currentOpponent }
        )
        do {
            let results = try context.fetch(fetchDescriptor)
            return results
        } catch {
            print("Failed to fetch team: \(error)")
            return []
        }
    }
    
    
    func resetScoreKeeper() -> Void {
        currentGoals = 0
        currentShots = 0
        currentShotType = []
        currentGoalCords = []
    }
    
    func addGoal() -> Void {
        currentGoals += 1
        print("goal!!!")
    }
    
    func subGoal() -> Void {
        if ((currentGoals - 1) >= 0) {
            currentGoals -= 1
        }
        print("goal!!!")
    }
    
    func addShot() -> Void {
        currentShots += 1;
        print("shot!!")
    }
    
    func isShutOut() -> Bool {
        return currentGoals == 0
    }
    
    func getgameState() -> Int {
        if (currentWin) {
            if (currentWin && currentOT && !currentShootout) {
                return 1;
            }
            else if (currentWin && currentOT && !currentShootout) {
                return 2;
            }
            return 0;
        }
        else if (currentLose) {
            if (currentLose && currentOT && !currentShootout) {
                return 4;
            }
            else if (currentLose && currentOT && !currentShootout) {
                return 5;
            }
            return 3;
        }
        // tie
        else {
            return 6;
        }
    }
    
}
