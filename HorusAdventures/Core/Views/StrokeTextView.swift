//
//  StrokeTextView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 22.09.2024.
//

import SwiftUI

struct StrokeTextView: View {
    
    let width: CGFloat = 0.5
    let text: String
    let textSize: CGFloat
    let textColor: Color
    let strokeColor: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(strokeColor)
            
            Text(text)
                .foregroundStyle(textColor)
        }
        .font(.system(size: textSize))
    }
}

#Preview {
    StrokeTextView(text: "Hello world", textSize: 25, textColor: .yellow, strokeColor: .black)
}
