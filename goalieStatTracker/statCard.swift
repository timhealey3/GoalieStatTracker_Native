//
//  statCard.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/28/24.
//

import Foundation
import SwiftUI

struct StatCardView: View {
    let stats:  [Int]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .font(.headline)
            HStack {
                Label("Shots: \(stats.count)", systemImage: "person.3")
                Spacer()
                Label("Goals: \(stats.count)", systemImage: "clock")
                Spacer()
                Label("Saves \(stats.count)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
            HStack {
                Label("GAA: \(stats.count)", systemImage: "person.3")
                Spacer()
                Label("GA: \(stats.count)", systemImage: "clock")
                Spacer()
                Label("W-L \(stats.count)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
    }
}
