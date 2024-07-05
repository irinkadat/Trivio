//
//  DailyQuizCard.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct DailyQuizCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Daily Quiz")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Play, earn, compete")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
            
            Button(action: {
            }) {
                Text("Join a quiz")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(25)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(25)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}


#Preview {
    DailyQuizCard()
}
