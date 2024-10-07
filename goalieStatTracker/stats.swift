//
//  stats.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/6/24.
//

import Foundation
import SwiftUI

struct statsView : View {
    var body: some View {
        VStack {
            navBar()
            .navigationTitle("Stats")
        }
    }
}

struct statsPreview: PreviewProvider {
    static var previews: some View {
        statsView()
    }
}
