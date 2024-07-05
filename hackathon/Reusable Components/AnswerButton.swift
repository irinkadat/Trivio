//
//  AnswerButton.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 06.07.24.
//

import SwiftUI

struct AnswerButton: View {
    let answer: Answer
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(answer.answerText)
                    .foregroundColor(isSelected ? .black : .primary)
                Spacer()
                if isSelected {
                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(answer.isCorrect ? .green : .red)
                }
            }
            .padding()
            .background(isSelected ? (answer.isCorrect ? Color.green.opacity(0.3) : Color.red.opacity(0.3)) : Color.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.customPurple, lineWidth: 2)
            )
        }
        .disabled(isSelected)
    }
}
