//
//  ContentView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @Binding var selectedTab: ContentView.Tab
    @State private var showSearchedQuizzes = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                HStack() {
                    Text("Trivio 🚀")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Profile(image: "profilePicture")
                            .padding([.top, .trailing], 8)
                    }
                }
                .padding(.horizontal, 20)
                
                ScrollView {
                    if let quizNumber = viewModel.quizNumber {
                        if quizNumber > 0 {
                            VStack {                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(viewModel.getQuizNumsArray(count: quizNumber), id: \.self) { number in
                                    Button(action: {
                                        viewModel.selectedQuizNumber = number
                                        selectedTab = .quiz
                                    }) {
                                        QuizCardView(number: number, category: viewModel.selectedCategory, subCategory: viewModel.selectedSubCategory, level: viewModel.selectedLevel)
                                            .padding(.horizontal, 5)
                                    }
                                }
                                
                            }
                            .padding(.horizontal, 10)
                                CustomButton(text: "Go Back", imageName: nil) {
                                    viewModel.resetSelections()
                                    viewModel.quizNumber = nil
                                }
                                .padding(.top, 20)
                            }
                            .padding(.vertical, 20)
                        } else {
                            Spacer().frame(height: 250)
                            showQuizNotFound
                        }
                    } else {
                        staticHomeContent
                    }
                }
            }
        }
        .background(.backgroundC)
        .environmentObject(viewModel)
    }
    
    @ViewBuilder
    private var staticHomeContent: some View {
        QuizSearchView(viewModel: viewModel)
        
        if viewModel.allDropdownsSelected {
            searchButton
                .padding(.top, 16)
        }
        
        VStack(alignment: .leading) {
            ProgressCardView(completedTasks: 14, incompleteTasks: 9)
                .padding(16)
            
            Text("Suggested Tasks")
                .font(.system(size: 24, weight: .bold))
                .padding(.leading, 20)
            
            Spacer().frame(height: 20)
            
            HStack(spacing: 13) {
                
                // MARK: - SongView and ChatView Stack
                SongView()
                VStack(spacing: 10) {
                    NewsView()
                    NewsView()
                }
            }
            .padding(.leading, 20)
            
            Spacer().frame(height: 20)
            Text("Daily Quiz 🔥")
                .font(.system(size: 24, weight: .bold))
                .padding(.leading, 20)
            
            DailyQuizCard()
        }
    }
    
    private func searchedQuizes(_ number: Int) -> some View {
        VStack {
            Text("Quiz \(number)")
            Text("Category: \(viewModel.selectedCategory)")
            Text("Subcategory: \(viewModel.selectedSubCategory)")
            Text("Level: \(viewModel.selectedLevel)")
        }
        
    }
    
    private var showQuizNotFound: some View {
        VStack {
            Text("Oops no Quiz on this topic yet! 🤷‍♂️")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.top, 20)
            
            CustomButton(text: "Clear Search", imageName: nil) {
                viewModel.resetSelections()
                viewModel.quizNumber = nil
            }
        }
    }
    
    private var searchButton: some View {
        CustomButton(text: "Search", imageName: "magnifyingglass", action: {
            print("Search button tapped")
            viewModel.fetchQuizNumber(category: viewModel.selectedCategory, subCategory: viewModel.selectedSubCategory, level: viewModel.selectedLevel)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(.home))
            .environmentObject(QuizViewModel())
    }
}
