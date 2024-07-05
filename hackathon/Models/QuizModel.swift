//
//  QuizModel.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import Foundation

struct Answer: Identifiable, Decodable {
    let id: Int
    let answerText: String
    let isCorrect: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case answerText = "answer_text"
        case isCorrect = "is_correct"
        
    }
}

struct QuizInfo: Decodable {
    let imageUrl: String
    let quizzCount: Int
}

struct Quiz: Identifiable, Decodable {
    let id: Int
    let testText: String
    let answers: [Answer]
}

struct QuizzResponse: Decodable {
    let quizzes: [Quiz]
}

