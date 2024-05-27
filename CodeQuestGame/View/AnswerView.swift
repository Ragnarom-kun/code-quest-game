//
//  AnswerView.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 27/05/24.
//


import SwiftUI

struct AnswerView: View {
    @ObservedObject var questViewModel: QuestViewModel
    
    var body: some View {
        VStack {
            if let quest = questViewModel.currentQuest {
                Text(quest.question)
                    .font(.title)
                    .padding()
                
                TextField("Enter your answer", text: $questViewModel.answer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if questViewModel.checkAnswer() {
                        print("Correct Answer")
                        // Add any additional logic for correct answer (e.g., show a success message)
                    } else {
                        print("Incorrect Answer")
                        // Add any additional logic for incorrect answer (e.g., show an error message)
                    }
                }) {
                    Text("Submit")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            } else {
                Text("No current quest")
                    .font(.title)
                    .padding()
            }
        }
        .navigationBarTitle("Submit Answer", displayMode: .inline)
    }
}


