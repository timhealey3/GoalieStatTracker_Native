//
//  scoreKeeperHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation
import SwiftData

enum GameOutcome: String, CaseIterable, Identifiable {
    case win, lose, tie
    var id: Self { self }
}

enum GameOutcomeOT: String, CaseIterable, Identifiable {
    case none, overtime, shootout
    var id: Self { self }
}

enum Periods: String, CaseIterable, Identifiable {
    case first, second, third, overtime
    var id: Self { self }
}

class scoreKeeperHelper : ObservableObject{

    // Period 1 variables
    @Published var firstGoals: Int = 0
    @Published var firstShots: Int = 0
    // Period 2 variables
    @Published var secondGoals: Int = 0
    @Published var secondShots: Int = 0
    // Period 3 variables
    @Published var thirdGoals: Int = 0
    @Published var thirdShots: Int = 0
    // Overtime variables
    @Published var overtimeGoals: Int = 0
    @Published var overtimeShots: Int = 0
    // general variables
    @Published var opponent: String = ""
    @Published var winInd: Bool = false
    @Published var loseInd: Bool = false
    @Published var tieInd: Bool = false
    @Published var gameOutcomeVar: GameOutcome = .win
    @Published var gameOutcomeOTVar: GameOutcomeOT = .none
    @Published var currentPeriodsVar: Periods = .first
    @Published var OtInd: Bool = false
    @Published var ShootoutInd: Bool = false
    @Published var Notes: String = ""
    @Published var shotType: [String] = ["Slapshot", "Wristshot", "Breakaway", "Rebound"]
    @Published var ShotType: [String] = []
    @Published var GoalCords: [[Float]] = []
    @Published var ShotCords: [[Float]] = []
    var opponentID: Int = 0
    
    
    func resetScoreKeeper() -> Void {
        ShotType = []
        GoalCords = []
    }
    
    func isShutOut() -> Bool {
        return (firstGoals + secondGoals + thirdGoals + overtimeGoals) == 0
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
    
    // goal functions
    func subtractGoal() -> Void {
        switch currentPeriodsVar {
        case Periods.first:
            firstGoals = firstGoals > 0 ? firstGoals - 1 : 0
        case Periods.second:
            secondGoals = secondGoals > 0 ? secondGoals - 1 : 0
        case Periods.third:
            thirdGoals = thirdGoals > 0 ? thirdGoals - 1 : 0
        case Periods.overtime:
            overtimeGoals = overtimeGoals > 0 ? overtimeGoals - 1 : 0
        }
    }
    
    func addGoal() -> Void {
        switch currentPeriodsVar {
        case Periods.first:
            firstGoals += 1
        case Periods.second:
            secondGoals += 1
        case Periods.third:
            thirdGoals += 1
        case Periods.overtime:
            overtimeGoals += 1
        }
    }
    
    func getGoals() -> Int {
        switch currentPeriodsVar {
        case Periods.first:
            return firstGoals
        case Periods.second:
            return secondGoals
        case Periods.third:
            return thirdGoals
        case Periods.overtime:
            return overtimeGoals
        }
    }
    
    // shots functions
    func getShots() -> Int {
        switch currentPeriodsVar {
        case Periods.first:
            return firstShots
        case Periods.second:
            return secondShots
        case Periods.third:
            return thirdShots
        case Periods.overtime:
            return overtimeShots
        }
    }
    
    func subtractShot() -> Void {
        switch currentPeriodsVar {
        case Periods.first:
            firstShots = firstShots > 0 ? firstShots - 1 : 0
        case Periods.second:
            secondShots = secondShots > 0 ? secondShots - 1 : 0
        case Periods.third:
            thirdShots = thirdShots > 0 ? thirdShots - 1 : 0
        case Periods.overtime:
            overtimeShots = overtimeShots > 0 ? overtimeShots - 1 : 0
        }
    }
    
    func addShot() -> Void {
        switch currentPeriodsVar {
        case Periods.first:
            firstShots += 1
        case Periods.second:
            secondShots += 1
        case Periods.third:
            thirdShots += 1
        case Periods.overtime:
            overtimeShots += 1
        }
    }
}
