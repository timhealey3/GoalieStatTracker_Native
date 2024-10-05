//
//  scoreKeperBasicHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/4/24.
//

import Foundation
import SwiftData


class scoreKeeperBasicHelper : ObservableObject{

    @Published var goals: Int = 0
    @Published var shots: Int = 0
    @Published var opponent: String = ""
    @Published var winInd: Bool = false
    @Published var loseInd: Bool = false
    @Published var tieInd: Bool = false
    @Published var gameOutcomeVar: GameOutcome = .win
    @Published var gameOutcomeOTVar: GameOutcomeOT = .none
    @Published var OtInd: Bool = false
    @Published var ShootoutInd: Bool = false
    @Published var Notes: String = ""
    @Published var shotType: [String] = ["Slapshot", "Wristshot", "Breakaway", "Rebound"]
    @Published var ShotType: [String] = []
    @Published var GoalCords: [[Float]] = []
    @Published var ShotCords: [[Float]] = []
    var opponentID: Int = 0
    
    func fetchOpponentID(from context: ModelContext) -> [Team] {
        let fetchDescriptor = FetchDescriptor<Team>(
            predicate: #Predicate { $0.teamName == opponent }
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
        goals = 0
        shots = 0
        ShotType = []
        GoalCords = []
    }
    
    func isShutOut() -> Bool {
        return goals == 0
    }
    
    func getgameState() -> Int {
        if (winInd) {
            if (winInd && OtInd && !ShootoutInd) {
                return 1;
            }
            else if (winInd && OtInd && !ShootoutInd) {
                return 2;
            }
            return 0;
        }
        else if (loseInd) {
            if (loseInd && OtInd && !ShootoutInd) {
                return 4;
            }
            else if (loseInd && OtInd && !ShootoutInd) {
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
