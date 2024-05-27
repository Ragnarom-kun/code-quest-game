//
//  QuestionView.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 27/05/24.
//


import SwiftUI

struct QuestionView: View {
    @ObservedObject var questViewModel: QuestViewModel
    
    var body: some View {
        VStack {
            if let quest = questViewModel.currentQuest {
                Text(quest.question)
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: AnswerView(questViewModel: questViewModel)) {
                    Text("Submit Answer")
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



