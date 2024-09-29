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
                Label("W-L \(stats.count)", systemImage: "clock")

                    .padding(.trailing, 20)
            }
            .font(.caption)
            HStack {
                Label("Shots: \(stats.count)", systemImage: "person.3")
                Spacer()
                Label("Goals: \(stats.count)", systemImage: "clock")
                Spacer()
                Label("W-L \(stats.count)", systemImage: "clock")

                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
    }
}

struct StatCard: PreviewProvider {
    static var stats = [0, 0, 0]
    static var previews: some View {
        StatCardView(stats: stats) // Correctly pass stats to StatCardView
            .previewLayout(.fixed(width: 400, height: 60)) // Fix layout
    }
}
