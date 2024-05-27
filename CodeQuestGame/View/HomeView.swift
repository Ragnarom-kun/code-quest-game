//
//  HomeView.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 27/05/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var beaconManager = BeaconManager()
    @StateObject var questViewModel = QuestViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Code Quest")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: RadarView(beaconManager: beaconManager, questViewModel: questViewModel)) {
                    Text("Start Game")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                if beaconManager.questAvailable {
                    NavigationLink(destination: QuestionView(questViewModel: questViewModel), isActive: $beaconManager.questAvailable) {
                        EmptyView()
                    }
                }
            }
            .onAppear {
                beaconManager.startMonitoring()
            }
        }
    }
}

