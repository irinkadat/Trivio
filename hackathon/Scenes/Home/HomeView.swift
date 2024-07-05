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
        VStack(alignment: .center) {
            HStack() {
                Text("Trivio 🚀")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                
                Profile(image: "profilePicture")
                    .padding([.top, .trailing], 8)
                    .onTapGesture {
                        selectedTab = .profile
                    }
                
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                if let quizNumber = viewModel.quizNumber {
                    if quizNumber > 0 {
                        VStack {
                            LazyVGrid(
                                columns: [
                                    GridItem(.flexible(), spacing: -2),
                                    GridItem(.flexible(), spacing: -2)
                                ],
                                spacing: 12
                            ) {
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
            ProgressCardView()
                .padding(16)
            
            Text("შემოთავაზებები")
                .font(.system(size: 22, weight: .bold))
                .padding(.leading, 20)
            
            Spacer().frame(height: 14)
            
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
            
            Text("დღის დავალება 🔥")
                .font(.system(size: 22, weight: .bold))
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
