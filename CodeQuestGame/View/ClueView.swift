//
//  ClueView.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 27/05/24.
//


import SwiftUI

struct ClueView: View {
    @ObservedObject var questViewModel: QuestViewModel
    
    var body: some View {
        VStack {
            if let quest = questViewModel.currentQuest {
                Text(quest.clue)
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: AnswerView(questViewModel: questViewModel)) {
                    Text("Return to Beacon 1 to answer")
                        .padding()
                }
            } else {
                Text("No current quest")
                    .font(.title)
                    .padding()
            }
        }
        .navigationBarTitle("Current Quest", displayMode: .inline)
    }
}

