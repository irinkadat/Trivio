//
//  QuizViewModel.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var quizNumber: Int?
    @Published var selectedQuizNumber: Int?
    @Published var quiz: Quiz?
    @Published var selectedQuizzes: [Quiz] = []
    @Published var errorMessage: String?
    @Published var selectedCategory: String = ""
    @Published var selectedSubCategory: String = ""
    @Published var selectedLevel: String = ""
    @Published var quizImage: String?
    
    let categories = ["PROGRAMMING", "მათემატიკური", "TBC", "კოლეჯი"]
    var allDropdownsSelected: Bool {
        return !selectedCategory.isEmpty && !selectedSubCategory.isEmpty && !selectedLevel.isEmpty
    }
    
    var subCategories: [String] {
        switch selectedCategory {
        case "PROGRAMMING":
            return ["PYTHON", "IOS", "REACT"]
        case "მათემატიკური":
            return ["უმაღლესი მათემატიკა"]
        case "TBC":
            return ["ინვესტიციები"]
        default:
            return []
        }
    }
    
    var levels: [String] {
        switch selectedCategory {
        case "PROGRAMMING", "მათემატიკური":
            return ["Intro", "Advance"]
        case "TBC":
            return ["აქციები"]
        default:
            return []
        }
    }
    
    func resetSelections() {
        selectedCategory = ""
        selectedSubCategory = ""
        selectedLevel = ""
    }
    
    func fetchQuizNumber(category: String, subCategory: String, level: String) {
        guard let url = URL(string: "https://kopa.ge/gettest/?cat1=\(category)&cat2=\(subCategory)&cat3=\(level)&quizNumb=") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data:", error ?? "Unknown error")
                return
            }
            
            do {
                let quizResponse = try JSONDecoder().decode([QuizInfo].self, from: data)
                if let quizInfo = quizResponse.first {
                    DispatchQueue.main.async {
                        self.quizNumber = quizInfo.quizzCount
                        self.quizImage = quizInfo.imageUrl
                        
                        print(self.quizNumber ?? "No number")
                        print(self.quizImage ?? "No image")
                    }
                }
            } catch {
                print("Failed to decode JSON:", error.localizedDescription)
            }
        }.resume()
    }
    
    func getQuizNumsArray(count: Int) -> [Int] {
        return count > 0 ? Array(1...count) : []
    }
    
    func getquizForNum(number: Int) {
        fetchQuiz(category: selectedCategory, subCategory: selectedSubCategory, level: selectedLevel, quizNumber: number)
    }
    
    func fetchQuiz(category: String, subCategory: String, level: String, quizNumber: Int) {
        let urlString = "https://kopa.ge/gettest/?cat1=\(category)&cat2=\(subCategory)&cat3=\(level)&quizNumb=\(quizNumber)"
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")"
                }
                return
            }
            
            do {
                let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
                DispatchQueue.main.async {
                    self.selectedQuizzes = quizzes
                    print(self.selectedQuizzes)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode JSON: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

