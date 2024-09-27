//
//  StartView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 22.09.2024.
//

import SwiftUI

struct StartView: View {
    
    @State private var isVisible = false
    
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.8)
                .blur(radius: 5)
            
            StrokeTextView(
                text: "Discover the wonders of ancient Egypt, from majestic pyramids to timeless temples. Navigate through history with our interactive map, plan your routes, and immerse yourself in the culture with Egyptian music. Earn achievements by visiting and capturing your experiences at each landmark. Your journey through time begins now!",
                textSize: 20,
                textColor: .yellow,
                strokeColor: .black
            )
            .multilineTextAlignment(.center)
            .padding()
            .fontWeight(.bold)
            .padding()
            .opacity(isVisible ? 1 : 0)
            .task {
                withAnimation(.easeInOut(duration: 1.5)) {
                    isVisible = true
                }
            }
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            onDismiss()
        }
    }
}

#Preview {
    StartView{}
}
