//
//  QuizCardView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct QuizCardView: View {
    let number: Int
    let category: String
    let subCategory: String
    let level: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image("\(subCategory)")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(16)
                    .padding(.top, 8)
                    .padding(.leading, 2)
                
                Spacer()
                Text("\(level)")
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 8)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .padding(EdgeInsets(top: 14, leading: 0, bottom: 0, trailing: 20))
            }
            Group {
                Text("Quiz \(number)")
                
                Group {
                    Text("Category: \(category)")
                    
                    Text("Subcategory: \(subCategory)")
                }
                .font(.system(size: 10))
                
            }
            .padding(.leading, 12)
        }
        .frame(width: 170, height: 110, alignment: .topLeading)
        .background(.customPurple)
        .foregroundColor(.white)
        .font(.system(size: 12))
        .cornerRadius(18)
    }
}

#Preview {
    QuizCardView(number: 1, category: "Programming", subCategory: "პითონი", level: "Intro")
}
