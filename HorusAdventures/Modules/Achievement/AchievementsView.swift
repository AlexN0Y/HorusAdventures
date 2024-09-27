//
//  AchievementsView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 25.09.2024.
//

import SwiftUI

struct AchievementsView: View {
    
    @StateObject var achievementManager: AchievementManager = .shared
    
    var body: some View {
        NavigationView {
            List(attractions) { attraction in
                NavigationLink(destination: AttractionView(attraction: attraction)) {
                    attractionCell(attraction)
                }
                .listRowBackground(achievementManager.isAchievementUnlocked(for: attraction.name) ? Color(UIColor.yellow.withAlphaComponent(0.3)) : Color(UIColor.lightGray.withAlphaComponent(0.3)))
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Achievements")
            .listStyle(PlainListStyle())
            .padding(.horizontal)
        }
    }
    
    private func attractionCell(_ attraction: Attraction) -> some View {
        HStack {
            Image(attraction.baseImageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            Text(attraction.name)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding()
        .cornerRadius(8)
    }
}

#Preview {
    AchievementsView()
}
