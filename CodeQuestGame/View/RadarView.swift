//
//  RadarView.swift
//  CodeQuestGame
//
//  Created by Romi Fadhurohman Nabil on 27/05/24.
//

import SwiftUI

struct RadarView: View {
    @ObservedObject var beaconManager: BeaconManager
    @ObservedObject var questViewModel: QuestViewModel
    
    @State private var radarOpacity: Double = 0.5
    
    var body: some View {
        VStack {
            Text("Searching for Beacon 1...")
                .font(.title)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .opacity(radarOpacity)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            radarOpacity = 1
                        }
                    }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                    .opacity(beaconManager.questAvailable ? 1 : 0)
            }
            .frame(width: 300, height: 300)
            
            Spacer()
            
            if beaconManager.questAvailable {
                NavigationLink(destination: QuestionView(questViewModel: questViewModel)) {
                    Text("Quest Found! Tap to start")
                        .padding()
                }
                .onAppear {
                    questViewModel.loadQuest(for: beaconManager.nearestBeacon!)
                }
            }
        }
    }
}

