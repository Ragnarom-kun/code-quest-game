//
//  QuestViewModel.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 21/05/24.
//

import SwiftUI
import CoreLocation

class QuestViewModel: ObservableObject {
    @Published var currentQuest: Quest?
    @Published var answer: String = ""

    func loadQuest(for beacon: CLBeacon) {
        if beacon.uuid == UUID(uuidString: "14D8F312-5213-4674-AD77-95F3AF932992") {
//            currentQuest = Quest(id: UUID(), question: "What is 2+2?", clue: "It is the number of legs on a chair.", answer: "4")
            currentQuest = Quest(id: UUID(), question: "How can you use a loop to print 'Hello' five times in Swift?", answer: "for i in 1...5 { print('Hello') }")
        }
    }

    func checkAnswer() -> Bool {
        return answer == currentQuest?.answer
    }
}
