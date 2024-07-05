//
//  ProgressCardView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct ProgressCardView: View {
    var completedTasks: Int
    var incompleteTasks: Int
    
    var body: some View {
        
        let percentage = completedTasks * 100 / (completedTasks + incompleteTasks)
        VStack(alignment: .leading, spacing: 10) {
            Text("Daily Tasks")
                .font(.system(size: 18, weight: .medium))
            
            Text("\(completedTasks)/\(completedTasks + incompleteTasks)")
                .font(.system(size: 16, weight: .regular))
            
            VStack {
                HStack(alignment: .bottom) {
                    
                    Text("Keep  working")
                        .font(.system(size: 14, weight: .light))
                    Spacer()
                    
                    Text("\(percentage)%")
                        .font(.system(size: 16, weight: .regular))
                }
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        
                        Rectangle()
                            .foregroundStyle(.customPurple2.opacity(0.4))
                            .cornerRadius(20)
                            .frame(height: 18)
                        
                        Rectangle()
                            .foregroundStyle(.purple3.opacity(0.8))
                            .cornerRadius(20)
                            .frame(width: geometry.size.width * Double(percentage) * 0.01)
                            .animation(.smooth(), value: Double(percentage) * 0.01)
                            .frame(height: 18)
                    }
                }
                Spacer()
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.customPurple, .progress]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(.white)
        .cornerRadius(16)
        .frame(height: 150)
    }
}
