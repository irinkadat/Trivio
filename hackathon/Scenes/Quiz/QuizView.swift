//
//  QuizView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @State private var selectedAnswer: Int?
    @State private var currentQuestionIndex = 0
    @State private var correctAnswers = 0
    @State private var incorrectAnswers = 0
    @State private var showExplanation = false
    @Binding var selectedTab: ContentView.Tab
    @State private var animateFinish = false
    
    var body: some View {
        VStack {
            if !viewModel.selectedQuizzes.isEmpty && currentQuestionIndex < viewModel.selectedQuizzes.count {
                let quiz = viewModel.selectedQuizzes[currentQuestionIndex]
                VStack(alignment: .center) {
                    HStack {
                        Text("\(currentQuestionIndex + 1)/\(viewModel.selectedQuizzes.count)")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                            
                            Text("\(correctAnswers)")
                                .font(.subheadline)
                            
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.red)
                            
                            Text("\(incorrectAnswers)")
                                .font(.subheadline)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    if showExplanation {
                        VStack {
                            Text("არასწორია, ნახე დოკუმენტაცია 👉")
                                .lineLimit(3)
                            
                            Button("აქ") {
                            }
                        }
                        .font(.body)
                        .padding()
                        .font(.system(size: 16))
                        
                        .background(Color.customPurple2.opacity(0.2))
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    }
                    
                    Text(quiz.testText)
                        .font(.system(size: 14))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.customPurple)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                        .bold()
                    
                    VStack(spacing: 10) {
                        ForEach(quiz.answers) { answer in
                            AnswerButton(answer: answer, isSelected: selectedAnswer == answer.id) {
                                if selectedAnswer == nil {
                                    selectedAnswer = answer.id
                                    if answer.isCorrect {
                                        correctAnswers += 1
                                    } else {
                                        incorrectAnswers += 1
                                        showExplanation = true
                                    }
                                }
                            }
                            .disabled(selectedAnswer != nil)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding()
                Spacer()
                
                Button(action: nextQuestion) {
                    Text(currentQuestionIndex < viewModel.selectedQuizzes.count - 1 ? "Next" : "Finish")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(animateFinish ? Color.green.opacity(0.7) : .customPurple)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            } else {
                Text("You have't chosen Quiz Yet ☹️")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        }
        .onAppear {
            if let selectedQuizNumber = viewModel.selectedQuizNumber {
                viewModel.fetchQuiz(category: viewModel.selectedCategory, subCategory: viewModel.selectedSubCategory, level: viewModel.selectedLevel, quizNumber: selectedQuizNumber)
            }
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < viewModel.selectedQuizzes.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
            showExplanation = false
        } else {
            withAnimation(.easeInOut(duration: 1.0)) {
                animateFinish = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    selectedTab = .home
                }
                resetQuiz()
            }
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        selectedAnswer = nil
        correctAnswers = 0
        incorrectAnswers = 0
        showExplanation = false
        animateFinish = false
        viewModel.selectedQuizNumber = nil
        viewModel.selectedQuizzes.removeAll()
    }
}

struct QuizView2_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(selectedTab: .constant(.quiz))
            .environmentObject(QuizViewModel())
    }
}
